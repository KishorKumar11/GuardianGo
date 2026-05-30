import 'package:isar/isar.dart';

part 'corpus_chunk.g.dart';

@collection
class CorpusChunk {
  Id id = Isar.autoIncrement;

  /// Source URL on mom.gov.sg
  late String sourceUrl;

  /// Plain text chunk (~300 tokens)
  late String text;

  /// Pre-computed embedding vector.
  late List<double> embedding;

  @Index()
  late String topic; // e.g. 'overtime', 'injury', 'contract'
}
