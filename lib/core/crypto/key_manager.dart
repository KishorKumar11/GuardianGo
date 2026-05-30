import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:guardiago/core/crypto/crypto_service.dart';

/// Manages the app's AES-256 key: generates one on first run and persists it in
/// the platform secure storage (iOS Keychain / Android Keystore-backed).
class KeyManager {
  static const _keyAlias = 'guardiago_aes_key';
  final FlutterSecureStorage _storage;

  KeyManager({FlutterSecureStorage? storage})
      : _storage = storage ?? const FlutterSecureStorage();

  Future<CryptoService> getCryptoService() async {
    var existingKey = await _storage.read(key: _keyAlias);
    if (existingKey == null) {
      existingKey = _generateKey();
      await _storage.write(key: _keyAlias, value: existingKey);
    }
    return CryptoService.withKey(existingKey);
  }

  String _generateKey() {
    final random = Random.secure();
    final bytes = Uint8List.fromList(
      List.generate(32, (_) => random.nextInt(256)),
    );
    return base64.encode(bytes);
  }
}
