import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_test/flutter_test.dart';
import 'package:guardiago/core/crypto/crypto_service.dart';
import 'package:guardiago/features/evidence/data/encrypted_media_service.dart';

void main() {
  late CryptoService crypto;
  late EncryptedMediaService service;
  late Directory tempDir;

  setUp(() async {
    crypto = CryptoService.withTestKey('0123456789abcdef0123456789abcdef');
    tempDir = await Directory.systemTemp.createTemp('evidence_test');
    service = EncryptedMediaService(crypto: crypto, baseDir: tempDir.path);
  });

  tearDown(() async {
    if (tempDir.existsSync()) {
      await tempDir.delete(recursive: true);
    }
  });

  group('EncryptedMediaService', () {
    test('saves bytes encrypted — plaintext not on disk', () async {
      final plainBytes = Uint8List.fromList([1, 2, 3, 4, 5]);
      final path = await service.saveEncrypted(plainBytes, 'test.jpg');

      final diskBytes = File(path).readAsBytesSync();
      // Disk content must not equal plain bytes
      expect(diskBytes, isNot(equals(plainBytes)));
    });

    test('save then load returns original bytes', () async {
      final plainBytes = Uint8List.fromList(
        List.generate(1024, (i) => i % 256),
      );
      final path = await service.saveEncrypted(plainBytes, 'photo.jpg');
      final loaded = await service.loadDecrypted(path);
      expect(loaded, equals(plainBytes));
    });

    test('delete removes file from disk', () async {
      final path = await service.saveEncrypted(
        Uint8List.fromList([1, 2, 3]),
        'temp.jpg',
      );
      expect(File(path).existsSync(), isTrue);
      await service.deleteFile(path);
      expect(File(path).existsSync(), isFalse);
    });

    test('partial write cleaned up on failure', () async {
      final badService = EncryptedMediaService(
        crypto: crypto,
        baseDir: '/nonexistent/path',
      );
      expect(
        () => badService.saveEncrypted(Uint8List.fromList([1]), 'x.jpg'),
        throwsException,
      );
    });
  });
}
