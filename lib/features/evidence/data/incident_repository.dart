import 'package:isar/isar.dart';
import 'package:guardiago/features/evidence/domain/incident_log.dart';

/// Persistence for [IncidentLog] records, backed by Isar.
class IncidentRepository {
  final Isar _isar;
  const IncidentRepository(this._isar);

  Future<void> save(IncidentLog incident) async {
    await _isar.writeTxn(() => _isar.incidentLogs.put(incident));
  }

  Future<List<IncidentLog>> getAll() async {
    return _isar.incidentLogs.where().sortByTimestampDesc().findAll();
  }

  Future<void> delete(Id id) async {
    await _isar.writeTxn(() => _isar.incidentLogs.delete(id));
  }
}
