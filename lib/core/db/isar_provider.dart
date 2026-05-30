import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:guardiago/features/salary/domain/shift_log.dart';

// Overridden in main.dart once Isar is opened.
final isarProvider = Provider<Isar>((ref) {
  throw UnimplementedError('Isar must be initialised before use');
});

Future<Isar> openIsar() async {
  final dir = await getApplicationDocumentsDirectory();
  return Isar.open(
    [
      ShiftLogSchema,
      // TODO: register remaining schemas as their tasks land:
      //   IncidentLogSchema   (Task 2.1)
      //   CorpusChunkSchema   (rights module)
      //   DocumentResultSchema(documents module)
    ],
    directory: dir.path,
    name: 'guardiago_db',
  );
}
