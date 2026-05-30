import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:guardiago/core/constants/app_constants.dart';
import 'package:guardiago/features/backup/data/qr_chunker.dart';

void main() {
  group('QrChunker', () {
    test('small payload produces single chunk', () {
      final payload = utf8.encode('hello');
      final chunks = QrChunker.chunk(payload);
      expect(chunks.length, 1);
    });

    test('large payload splits into multiple chunks', () {
      final payload = List<int>.generate(
        AppConstants.qrChunkSizeBytes * 3 + 100,
        (i) => i % 256,
      );
      final chunks = QrChunker.chunk(payload);
      expect(chunks.length, greaterThan(3));
    });

    test('reassemble returns original bytes', () {
      final original = List<int>.generate(5000, (i) => i % 256);
      final chunks = QrChunker.chunk(original);
      final reassembled = QrChunker.reassemble(chunks);
      expect(reassembled, equals(original));
    });

    test('chunk metadata contains index and total', () {
      final payload = List<int>.generate(
        AppConstants.qrChunkSizeBytes * 2 + 1,
        (i) => 0,
      );
      final chunks = QrChunker.chunk(payload);
      for (var i = 0; i < chunks.length; i++) {
        final meta = QrChunker.parseMetadata(chunks[i]);
        expect(meta.index, i);
        expect(meta.total, chunks.length);
      }
    });

    test('missing chunk causes reassemble to throw', () {
      final payload = List<int>.generate(
        AppConstants.qrChunkSizeBytes * 3,
        (i) => i % 256,
      );
      final chunks = QrChunker.chunk(payload);
      // Remove middle chunk
      chunks.removeAt(1);
      expect(() => QrChunker.reassemble(chunks), throwsException);
    });
  });
}
