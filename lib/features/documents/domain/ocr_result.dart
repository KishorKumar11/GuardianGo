/// Result of running on-device OCR over a document image.
class OcrResult {
  final String text;
  final double confidence;
  final String detectedLanguage;
  final bool isUsable;

  const OcrResult({
    required this.text,
    required this.confidence,
    required this.detectedLanguage,
    required this.isUsable,
  });

  /// True when no usable text was extracted.
  bool get isEmpty => text.trim().isEmpty;
}
