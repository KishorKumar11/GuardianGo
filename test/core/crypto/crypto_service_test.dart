import 'package:flutter_test/flutter_test.dart';
import 'package:guardiago/core/crypto/crypto_service.dart';

void main() {
  late CryptoService crypto;

  setUp(() {
    // Use a fixed test key — do NOT use real keys in tests
    crypto = CryptoService.withTestKey(
      '0123456789abcdef0123456789abcdef', // 32-byte key
    );
  });

  group('CryptoService', () {
    test('encrypt then decrypt returns original string', () {
      const original = 'My NRIC is S1234567A and salary is \$2000';
      final encrypted = crypto.encryptString(original);
      expect(encrypted, isNot(equals(original)));
      final decrypted = crypto.decryptString(encrypted);
      expect(decrypted, equals(original));
    });

    test('encrypt produces different ciphertext each call (IV randomness)', () {
      const original = 'same input';
      final enc1 = crypto.encryptString(original);
      final enc2 = crypto.encryptString(original);
      expect(enc1, isNot(equals(enc2)));
    });

    test('decrypt with wrong key throws', () {
      const original = 'secret';
      final encrypted = crypto.encryptString(original);
      final wrongCrypto = CryptoService.withTestKey(
        'ffffffffffffffffffffffffffffffff',
      );
      expect(() => wrongCrypto.decryptString(encrypted), throwsException);
    });

    test('encrypt bytes then decrypt returns original bytes', () {
      final original = List<int>.generate(256, (i) => i % 256);
      final encrypted = crypto.encryptBytes(original);
      final decrypted = crypto.decryptBytes(encrypted);
      expect(decrypted, equals(original));
    });
  });
}
