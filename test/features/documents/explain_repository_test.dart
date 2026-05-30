import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:guardiago/features/documents/data/explain_repository.dart';
import 'package:guardiago/features/documents/domain/ocr_result.dart';

void main() {
  group('ExplainRepository', () {
    test('parses successful Groq response into DocumentResult', () async {
      final mockGroqResponse = {
        'choices': [
          {
            'message': {
              'content': jsonEncode({
                'document_type': 'Work Permit Renewal Notice',
                'plain_summary':
                    'Your work permit needs to be renewed by 31 Jan.',
                'actions': ['Renew work permit before 31 Jan 2025'],
                'deadlines': ['31 January 2025'],
                'rights_flags': [
                  'You have the right to work until permit expires'
                ],
                'uncertainty': null,
              })
            }
          }
        ]
      };

      final mockClient = MockClient((request) async {
        return http.Response(jsonEncode(mockGroqResponse), 200);
      });

      final repo = ExplainRepository(
        httpClient: mockClient,
        groqApiKey: 'test-key',
      );

      const ocr = OcrResult(
        text: 'Work Permit Renewal Notice. Please renew by 31 Jan 2025.',
        confidence: 0.9,
        detectedLanguage: 'en',
        isUsable: true,
      );

      final result = await repo.explain(ocr, hashedNric: null);
      expect(result.documentType, 'Work Permit Renewal Notice');
      expect(result.actions, hasLength(1));
      expect(result.deadlines, contains('31 January 2025'));
    });

    test('returns pending result when offline', () async {
      final mockClient = MockClient((request) async {
        throw http.ClientException('No internet');
      });

      final repo = ExplainRepository(
        httpClient: mockClient,
        groqApiKey: 'test-key',
      );

      const ocr = OcrResult(
        text: 'Some document text',
        confidence: 0.9,
        detectedLanguage: 'en',
        isUsable: true,
      );

      final result = await repo.explain(ocr, hashedNric: null);
      expect(result.isPending, isTrue);
    });

    test('returns pending result on Groq rate limit (429)', () async {
      var callCount = 0;
      final mockClient = MockClient((request) async {
        callCount++;
        return http.Response('Rate limited', 429);
      });

      final repo = ExplainRepository(
        httpClient: mockClient,
        groqApiKey: 'test-key',
        maxRetries: 2,
        retryDelayMs: 0, // no delay in tests
      );

      const ocr = OcrResult(
        text: 'Document text',
        confidence: 0.9,
        detectedLanguage: 'en',
        isUsable: true,
      );

      final result = await repo.explain(ocr, hashedNric: null);
      expect(result.isPending, isTrue);
      expect(callCount, 2); // retried maxRetries times
    });
  });
}
