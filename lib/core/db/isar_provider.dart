import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:guardiago/features/salary/domain/shift_log.dart';
import 'package:guardiago/features/evidence/domain/incident_log.dart';
import 'package:guardiago/features/documents/domain/document_result.dart';
import 'package:guardiago/features/rights/domain/corpus_chunk.dart';

// Overridden in main.dart once Isar is opened.
final isarProvider = Provider<Isar>((ref) {
  throw UnimplementedError('Isar must be initialised before use');
});

Future<Isar> openIsar() async {
  final dir = await getApplicationDocumentsDirectory();
  return Isar.open(
    [
      ShiftLogSchema,
      IncidentLogSchema,
      DocumentResultSchema,
      CorpusChunkSchema,
    ],
    directory: dir.path,
    name: 'guardiago_db',
  );
}
