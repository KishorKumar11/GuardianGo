import 'package:flutter_test/flutter_test.dart';
import 'package:guardiago/core/errors/app_error.dart';

void main() {
  group('AppError', () {
    test('OcrFailure has correct message', () {
      const error = AppError.ocrFailure('blurry image');
      expect(error.message, contains('blurry image'));
    });

    test('NetworkFailure has correct message', () {
      const error = AppError.networkFailure('timeout');
      expect(error.message, contains('timeout'));
    });

    test('EncryptionFailure has correct message', () {
      const error = AppError.encryptionFailure('bad key');
      expect(error.message, contains('bad key'));
    });
  });
}
