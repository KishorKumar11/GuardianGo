import 'dart:io';
import 'dart:typed_data';
import 'package:guardiago/core/crypto/crypto_service.dart';

/// Stores media (photos, video, voice memos) AES-256 encrypted on disk. No
/// plaintext is ever written: bytes are encrypted in memory, written to a temp
/// file, then atomically renamed into place.
class EncryptedMediaService {
  final CryptoService _crypto;
  final String _baseDir;

  EncryptedMediaService({
    required CryptoService crypto,
    required String baseDir,
  })  : _crypto = crypto,
        _baseDir = baseDir;

  /// Encrypt bytes and write atomically. Returns the path of the encrypted file.
  Future<String> saveEncrypted(Uint8List bytes, String filename) async {
    final dir = Directory(_baseDir);
    if (!dir.existsSync()) {
      throw Exception('Base directory does not exist: $_baseDir');
    }

    final destPath =
        '$_baseDir/${DateTime.now().millisecondsSinceEpoch}_$filename.enc';
    final tempPath = '$destPath.tmp';

    try {
      final encrypted = _crypto.encryptBytes(bytes);
      final tempFile = File(tempPath);
      await tempFile.writeAsString(encrypted);
      // Atomic rename into final location.
      await tempFile.rename(destPath);
      return destPath;
    } catch (e) {
      // Clean up any partial write.
      final tempFile = File(tempPath);
      if (tempFile.existsSync()) await tempFile.delete();
      rethrow;
    }
  }

  /// Decrypt and return bytes from an encrypted file path.
  Future<Uint8List> loadDecrypted(String path) async {
    final content = await File(path).readAsString();
    return Uint8List.fromList(_crypto.decryptBytes(content));
  }

  /// Delete an encrypted file from disk.
  Future<void> deleteFile(String path) async {
    final file = File(path);
    if (file.existsSync()) await file.delete();
  }
}
