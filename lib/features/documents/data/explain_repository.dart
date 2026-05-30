import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:guardiago/core/constants/app_constants.dart';
import 'package:guardiago/features/documents/data/pii_scrubber.dart';
import 'package:guardiago/features/documents/domain/document_result.dart';
import 'package:guardiago/features/documents/domain/ocr_result.dart';

/// Sends PII-scrubbed OCR text to Groq for a plain-language explanation. Falls
/// back to a pending [DocumentResult] when offline or rate-limited, so the
/// Documents module always returns something the worker can act on.
class ExplainRepository {
  final http.Client _httpClient;
  final String _groqApiKey;
  final int _maxRetries;
  final int _retryDelayMs;

  ExplainRepository({
    required http.Client httpClient,
    required String groqApiKey,
    int maxRetries = 3,
    int retryDelayMs = 1000,
  })  : _httpClient = httpClient,
        _groqApiKey = groqApiKey,
        _maxRetries = maxRetries,
        _retryDelayMs = retryDelayMs;

  Future<DocumentResult> explain(
    OcrResult ocr, {
    required String? hashedNric,
  }) async {
    final scrubbed = PiiScrubber.scrub(ocr.text);
    final prompt = _buildPrompt(scrubbed);

    for (var attempt = 0; attempt < _maxRetries; attempt++) {
      try {
        final response = await _httpClient.post(
          Uri.parse('${AppConstants.groqBaseUrl}/chat/completions'),
          headers: {
            'Authorization': 'Bearer $_groqApiKey',
            'Content-Type': 'application/json',
          },
          body: jsonEncode({
            'model': AppConstants.groqModel,
            'max_tokens': AppConstants.groqMaxTokens,
            'messages': [
              {'role': 'system', 'content': _systemPrompt()},
              {'role': 'user', 'content': prompt},
            ],
            'response_format': {'type': 'json_object'},
          }),
        );

        if (response.statusCode == 200) {
          return _parseResponse(response.body, hashedNric: hashedNric);
        }

        if (response.statusCode == 429 || response.statusCode >= 500) {
          // Rate limited or server error — retry with backoff.
          if (attempt < _maxRetries - 1) {
            await Future<void>.delayed(
              Duration(milliseconds: _retryDelayMs * (attempt + 1)),
            );
          }
          continue;
        }

        // Non-retryable error.
        break;
      } catch (_) {
        // Network failure — return pending.
        break;
      }
    }

    // All attempts failed — return a pending result for the offline queue.
    return DocumentResult()
      ..hashedNric = hashedNric
      ..createdAt = DateTime.now()
      ..documentType = 'Unknown'
      ..plainSummary = ''
      ..actions = []
      ..deadlines = []
      ..rightsFlags = []
      ..isPending = true;
  }

  DocumentResult _parseResponse(String body, {required String? hashedNric}) {
    final json = jsonDecode(body) as Map<String, dynamic>;
    final content =
        (json['choices'] as List)[0]['message']['content'] as String;
    final data = jsonDecode(content) as Map<String, dynamic>;

    return DocumentResult()
      ..hashedNric = hashedNric
      ..createdAt = DateTime.now()
      ..documentType = data['document_type'] as String? ?? 'Unknown'
      ..plainSummary = data['plain_summary'] as String? ?? ''
      ..actions = List<String>.from(data['actions'] as List? ?? [])
      ..deadlines = List<String>.from(data['deadlines'] as List? ?? [])
      ..rightsFlags = List<String>.from(data['rights_flags'] as List? ?? [])
      ..uncertainty = data['uncertainty'] as String?
      ..isPending = false;
  }

  String _systemPrompt() => '''
You are a helpful assistant for migrant workers in Singapore.
You explain official documents in simple English.
Always respond with valid JSON matching exactly this structure:
{
  "document_type": "string",
  "plain_summary": "string (max 80 words, simple English, no jargon)",
  "actions": ["string"],
  "deadlines": ["string"],
  "rights_flags": ["string"],
  "uncertainty": "string or null"
}
If you are not certain about any rights claim, set uncertainty to a string
explaining what the worker should verify and include MOM hotline 6438 5122.
Never make up legal information. If unsure, say so in the uncertainty field.
''';

  String _buildPrompt(String scrubbedText) =>
      'Please explain this Singapore official document:\n\n$scrubbedText';
}
