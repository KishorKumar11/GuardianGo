import 'package:local_auth/local_auth.dart';

/// Wraps `local_auth` for gating the Evidence Locker. Degrades gracefully when
/// biometrics are unavailable (allows device PIN/passcode fallback) and never
/// throws — a failed or unavailable auth simply returns false.
class BiometricService {
  final LocalAuthentication _auth;

  BiometricService({LocalAuthentication? auth})
      : _auth = auth ?? LocalAuthentication();

  Future<bool> isAvailable() async {
    return _auth.canCheckBiometrics;
  }

  /// Authenticate the user. Returns true on success.
  Future<bool> authenticate(String reason) async {
    try {
      return await _auth.authenticate(
        localizedReason: reason,
        options: const AuthenticationOptions(
          biometricOnly: false, // allow PIN fallback
          stickyAuth: true,
        ),
      );
    } catch (_) {
      return false;
    }
  }
}
