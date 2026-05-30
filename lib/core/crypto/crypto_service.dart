import 'dart:convert';
import 'dart:typed_data';
import 'package:encrypt/encrypt.dart';

/// AES-256 (CBC) encryption with a random IV per message.
///
/// Ciphertext is serialised as `base64(iv):base64(ciphertext)` so the IV
/// travels with the payload and never has to be stored separately.
class CryptoService {
  final Key _key;

  CryptoService._(this._key);

  /// Production: key loaded from flutter_secure_storage (base64-encoded).
  factory CryptoService.withKey(String base64Key) {
    return CryptoService._(Key.fromBase64(base64Key));
  }

  /// Test only: fixed key for deterministic tests (32-byte hex string).
  factory CryptoService.withTestKey(String hexKey) {
    final bytes = Uint8List.fromList(
      List.generate(
        hexKey.length ~/ 2,
        (i) => int.parse(hexKey.substring(i * 2, i * 2 + 2), radix: 16),
      ),
    );
    return CryptoService._(Key(bytes));
  }

  String encryptString(String plaintext) {
    final iv = IV.fromSecureRandom(16);
    final encrypter = Encrypter(AES(_key, mode: AESMode.cbc));
    final encrypted = encrypter.encrypt(plaintext, iv: iv);
    return '${iv.base64}:${encrypted.base64}';
  }

  String decryptString(String ciphertext) {
    final parts = ciphertext.split(':');
    if (parts.length != 2) throw Exception('Invalid ciphertext format');
    final iv = IV.fromBase64(parts[0]);
    final encrypter = Encrypter(AES(_key, mode: AESMode.cbc));
    try {
      return encrypter.decrypt64(parts[1], iv: iv);
    } catch (e) {
      // Wrong key / corrupted payload surfaces from the cipher layer as an
      // Error (bad PKCS7 padding). Normalise to an Exception so callers can
      // catch decryption failures consistently.
      throw Exception('Decryption failed: $e');
    }
  }

  String encryptBytes(List<int> bytes) {
    return encryptString(base64.encode(bytes));
  }

  List<int> decryptBytes(String ciphertext) {
    return base64.decode(decryptString(ciphertext));
  }
}
