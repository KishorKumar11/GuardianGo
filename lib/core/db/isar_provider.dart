import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

// Overridden in main.dart once Isar is opened.
final isarProvider = Provider<Isar>((ref) {
  throw UnimplementedError('Isar must be initialised before use');
});

Future<Isar> openIsar() async {
  final dir = await getApplicationDocumentsDirectory();
  return Isar.open(
    [
      // TODO: register schemas as their tasks land:
      //   ShiftLogSchema      (Task 1.1)
      //   IncidentLogSchema   (Task 2.1)
      //   CorpusChunkSchema   (rights module)
      //   DocumentResultSchema(documents module)
    ],
    directory: dir.path,
    name: 'guardiago_db',
  );
}
