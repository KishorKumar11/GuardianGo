// Run once: dart run seed/embed_corpus.dart
// Requires: GROQ_API_KEY env var (for embedding via Groq API)
// Output: seeds the Isar DB with embedded corpus chunks.
//
// NOTE: This script runs at development time only, not in the app. The
// resulting Isar DB is bundled with the app as a read-only asset.
//
// ignore_for_file: avoid_print

import 'dart:io';

Future<void> main() async {
  final corpusDir = Directory('seed/mom_corpus');
  final apiKey = Platform.environment['GROQ_API_KEY'];
  if (apiKey == null) {
    print('ERROR: Set GROQ_API_KEY env var');
    exit(1);
  }

  final files = corpusDir
      .listSync()
      .whereType<File>()
      .where((f) => f.path.endsWith('.txt'));

  for (final file in files) {
    final topic = file.uri.pathSegments.last.replaceAll('.txt', '');
    final text = file.readAsStringSync();
    final chunks = _chunkText(text, maxTokens: 300);
    print('Processing $topic: ${chunks.length} chunks');
    // TODO: embed each chunk and write to the Isar seed DB.
    // Implementation uses the Groq embedding endpoint or a local embedding
    // model (all-MiniLM-L6-v2 via ONNX).
  }

  print('Seeding complete.');
}

List<String> _chunkText(String text, {required int maxTokens}) {
  // Approximate: 1 token ~= 4 chars.
  final maxChars = maxTokens * 4;
  final words = text.split(' ');
  final chunks = <String>[];
  var current = StringBuffer();

  for (final word in words) {
    if (current.length + word.length > maxChars) {
      chunks.add(current.toString().trim());
      current = StringBuffer();
    }
    current.write('$word ');
  }
  if (current.isNotEmpty) chunks.add(current.toString().trim());
  return chunks;
}
