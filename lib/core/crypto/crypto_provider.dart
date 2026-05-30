import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guardiago/core/crypto/crypto_service.dart';
import 'package:guardiago/core/crypto/key_manager.dart';

/// Async provider for the app-wide [CryptoService], backed by the key persisted
/// in secure storage via [KeyManager].
final cryptoServiceProvider = FutureProvider<CryptoService>((ref) async {
  return KeyManager().getCryptoService();
});
