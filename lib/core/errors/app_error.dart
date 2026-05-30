sealed class AppError {
  const AppError();
  String get message;

  const factory AppError.ocrFailure(String detail) = OcrFailure;
  const factory AppError.networkFailure(String detail) = NetworkFailure;
  const factory AppError.encryptionFailure(String detail) = EncryptionFailure;
  const factory AppError.storageFailure(String detail) = StorageFailure;
  const factory AppError.biometricFailure(String detail) = BiometricFailure;
  const factory AppError.llmFailure(String detail) = LlmFailure;
  const factory AppError.piiScrubFailure(String detail) = PiiScrubFailure;
  const factory AppError.translationFailure(String detail) = TranslationFailure;
  const factory AppError.qrFailure(String detail) = QrFailure;
}

final class OcrFailure extends AppError {
  final String detail;
  const OcrFailure(this.detail);
  @override
  String get message => 'OCR failed: $detail';
}

final class NetworkFailure extends AppError {
  final String detail;
  const NetworkFailure(this.detail);
  @override
  String get message => 'Network error: $detail';
}

final class EncryptionFailure extends AppError {
  final String detail;
  const EncryptionFailure(this.detail);
  @override
  String get message => 'Encryption error: $detail';
}

final class StorageFailure extends AppError {
  final String detail;
  const StorageFailure(this.detail);
  @override
  String get message => 'Storage error: $detail';
}

final class BiometricFailure extends AppError {
  final String detail;
  const BiometricFailure(this.detail);
  @override
  String get message => 'Biometric error: $detail';
}

final class LlmFailure extends AppError {
  final String detail;
  const LlmFailure(this.detail);
  @override
  String get message => 'LLM error: $detail';
}

final class PiiScrubFailure extends AppError {
  final String detail;
  const PiiScrubFailure(this.detail);
  @override
  String get message => 'PII scrub error: $detail';
}

final class TranslationFailure extends AppError {
  final String detail;
  const TranslationFailure(this.detail);
  @override
  String get message => 'Translation error: $detail';
}

final class QrFailure extends AppError {
  final String detail;
  const QrFailure(this.detail);
  @override
  String get message => 'QR error: $detail';
}
