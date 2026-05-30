import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:guardiago/features/documents/data/explain_repository.dart';
import 'package:guardiago/features/documents/data/ocr_service.dart';
import 'package:guardiago/features/documents/data/translation_service.dart';

final ocrServiceProvider = Provider<OcrService>((ref) {
  final service = OcrService();
  ref.onDispose(service.dispose);
  return service;
});

final explainRepositoryProvider = Provider<ExplainRepository>((ref) {
  final client = http.Client();
  ref.onDispose(client.close);
  return ExplainRepository(
    httpClient: client,
    groqApiKey: const String.fromEnvironment('GROQ_API_KEY'),
  );
});

final translationServiceProvider = Provider<TranslationService>((ref) {
  final service = TranslationService();
  ref.onDispose(service.dispose);
  return service;
});
