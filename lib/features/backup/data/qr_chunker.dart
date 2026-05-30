import 'dart:convert';
import 'package:guardiago/core/constants/app_constants.dart';

class ChunkMetadata {
  final int index;
  final int total;
  const ChunkMetadata({required this.index, required this.total});
}

/// Splits an encrypted backup payload into QR-safe strings and reassembles them.
///
/// Each chunk is `GGO:<index>/<total>:<base64data>`. Reassembly tolerates
/// out-of-order scanning but fails loudly if any chunk is missing.
class QrChunker {
  QrChunker._();

  /// Splits [payload] into QR-safe strings with a metadata prefix.
  static List<String> chunk(List<int> payload) {
    final base64Payload = base64.encode(payload);
    const chunkSize = AppConstants.qrChunkSizeBytes;

    final parts = <String>[];
    var start = 0;
    while (start < base64Payload.length) {
      parts.add(
        base64Payload.substring(
          start,
          (start + chunkSize).clamp(0, base64Payload.length),
        ),
      );
      start += chunkSize;
    }

    final total = parts.length;
    final chunks = <String>[];
    for (var i = 0; i < parts.length; i++) {
      chunks.add('GGO:$i/$total:${parts[i]}');
    }
    return chunks;
  }

  /// Parses metadata from a QR string without decoding its data.
  static ChunkMetadata parseMetadata(String qrString) {
    final parts = qrString.split(':');
    if (parts.length < 3 || parts[0] != 'GGO') {
      throw Exception('Invalid QR chunk format');
    }
    final indexTotal = parts[1].split('/');
    return ChunkMetadata(
      index: int.parse(indexTotal[0]),
      total: int.parse(indexTotal[1]),
    );
  }

  /// Reassembles chunks into the original bytes. Throws if any chunk is missing.
  static List<int> reassemble(List<String> chunks) {
    if (chunks.isEmpty) throw Exception('No chunks provided');

    final meta = parseMetadata(chunks.first);
    final total = meta.total;

    if (chunks.length != total) {
      throw Exception(
        'Missing chunks: expected $total, got ${chunks.length}',
      );
    }

    // Sort by index to handle out-of-order scanning.
    final sorted = List<String>.from(chunks)
      ..sort(
        (a, b) => parseMetadata(a).index.compareTo(parseMetadata(b).index),
      );

    // Validate no gaps.
    for (var i = 0; i < sorted.length; i++) {
      if (parseMetadata(sorted[i]).index != i) {
        throw Exception('Chunk gap at index $i');
      }
    }

    final combined = sorted.map((c) => c.split(':').last).join();
    return base64.decode(combined);
  }
}
