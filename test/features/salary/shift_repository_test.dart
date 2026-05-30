import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:guardiago/features/salary/data/shift_repository.dart';
import 'package:guardiago/features/salary/domain/shift_log.dart';

void main() {
  late Isar isar;
  late ShiftRepository repo;

  setUpAll(() async {
    await Isar.initializeIsarCore(download: true);
  });

  setUp(() async {
    isar = await Isar.open(
      [ShiftLogSchema],
      directory: '',
      name: 'test_${DateTime.now().millisecondsSinceEpoch}',
    );
    repo = ShiftRepository(isar);
  });

  tearDown(() async {
    await isar.close(deleteFromDisk: true);
  });

  group('ShiftRepository', () {
    test('save and retrieve a shift', () async {
      final shift = ShiftLog()
        ..clockIn = DateTime(2024, 1, 15, 9, 0)
        ..clockOut = DateTime(2024, 1, 15, 17, 0)
        ..breakMinutes = 30
        ..shiftType = ShiftType.normal
        ..basicHourlyRate = 10.0;

      await repo.save(shift);
      final all = await repo.getAllShifts();
      expect(all.length, 1);
      expect(all.first.basicHourlyRate, 10.0);
    });

    test('getShiftsForMonth returns correct month only', () async {
      final jan = DateTime(2024, 1, 15, 9, 0);
      final feb = DateTime(2024, 2, 15, 9, 0);

      for (final date in [jan, feb]) {
        final shift = ShiftLog()
          ..clockIn = date
          ..clockOut = date.add(const Duration(hours: 8))
          ..breakMinutes = 0
          ..shiftType = ShiftType.normal
          ..basicHourlyRate = 10.0;
        await repo.save(shift);
      }

      final janShifts = await repo.getShiftsForMonth(2024, 1);
      expect(janShifts.length, 1);
      expect(janShifts.first.clockIn.month, 1);
    });

    test('delete removes shift', () async {
      final shift = ShiftLog()
        ..clockIn = DateTime(2024, 1, 15, 9, 0)
        ..clockOut = DateTime(2024, 1, 15, 17, 0)
        ..breakMinutes = 0
        ..shiftType = ShiftType.normal
        ..basicHourlyRate = 10.0;

      await repo.save(shift);
      final saved = await repo.getAllShifts();
      await repo.delete(saved.first.id);
      final after = await repo.getAllShifts();
      expect(after, isEmpty);
    });
  });
}
