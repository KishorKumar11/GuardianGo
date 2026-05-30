import 'package:isar/isar.dart';
import 'package:guardiago/features/salary/domain/shift_log.dart';

/// Persistence for [ShiftLog] records, backed by Isar.
class ShiftRepository {
  final Isar _isar;
  const ShiftRepository(this._isar);

  Future<void> save(ShiftLog shift) async {
    await _isar.writeTxn(() => _isar.shiftLogs.put(shift));
  }

  Future<List<ShiftLog>> getAllShifts() async {
    return _isar.shiftLogs.where().findAll();
  }

  Future<List<ShiftLog>> getShiftsForMonth(int year, int month) async {
    final start = DateTime(year, month, 1);
    final end = DateTime(year, month + 1, 1);
    return _isar.shiftLogs
        .filter()
        .clockInGreaterThan(start)
        .clockInLessThan(end)
        .findAll();
  }

  Future<void> delete(Id id) async {
    await _isar.writeTxn(() => _isar.shiftLogs.delete(id));
  }
}
