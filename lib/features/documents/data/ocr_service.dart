import 'dart:io';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:google_mlkit_language_id/google_mlkit_language_id.dart';
import 'package:guardiago/core/constants/app_constants.dart';
import 'package:guardiago/features/documents/domain/ocr_result.dart';

/// On-device OCR using ML Kit. Tries Latin script first (most Singapore
/// documents are English), falling back to Chinese, and identifies the
/// language of the extracted text.
class OcrService {
  final _latinRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
  final _chineseRecognizer =
      TextRecognizer(script: TextRecognitionScript.chinese);
  final _devanagariRecognizer =
      TextRecognizer(script: TextRecognitionScript.devanagiri);
  final _languageIdentifier = LanguageIdentifier(confidenceThreshold: 0.5);

  Future<OcrResult> recognizeFromFile(File imageFile) async {
    final inputImage = InputImage.fromFile(imageFile);

    // Latin first — most SG documents are English.
    final latinResult = await _latinRecognizer.processImage(inputImage);
    final latinText = latinResult.blocks.map((b) => b.text).join('\n');

    if (latinText.trim().isEmpty) {
      // Try Chinese (Mandarin documents).
      final zhResult = await _chineseRecognizer.processImage(inputImage);
      final zhText = zhResult.blocks.map((b) => b.text).join('\n');

      if (zhText.trim().isEmpty) {
        return const OcrResult(
          text: '',
          confidence: 0.0,
          detectedLanguage: 'unknown',
          isUsable: false,
        );
      }
      final zhConfidence = _estimateConfidence(zhResult);
      return OcrResult(
        text: zhText,
        confidence: zhConfidence,
        detectedLanguage: 'zh',
        isUsable: zhConfidence >= AppConstants.ocrConfidenceThreshold,
      );
    }

    final detectedLang = await _languageIdentifier.identifyLanguage(latinText);
    final confidence = _estimateConfidence(latinResult);

    return OcrResult(
      text: latinText,
      confidence: confidence,
      detectedLanguage: detectedLang,
      isUsable: confidence >= AppConstants.ocrConfidenceThreshold,
    );
  }

  /// ML Kit's Flutter plugin doesn't expose per-block confidence, so estimate
  /// from whether coherent text blocks were recognised.
  double _estimateConfidence(RecognizedText result) {
    if (result.blocks.isEmpty) return 0.0;
    final totalElements = result.blocks
        .expand((b) => b.lines)
        .expand((l) => l.elements)
        .length;
    if (totalElements == 0) return 0.0;
    return 0.85;
  }

  Future<void> dispose() async {
    await _latinRecognizer.close();
    await _chineseRecognizer.close();
    await _devanagariRecognizer.close();
    _languageIdentifier.close();
  }
}
