import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:guardiago/core/db/isar_provider.dart';
import 'package:guardiago/features/salary/domain/shift_log.dart';
import 'package:guardiago/features/salary/providers/salary_providers.dart';

void main() {
  late Isar isar;

  setUpAll(() async {
    await Isar.initializeIsarCore(download: true);
  });

  setUp(() async {
    isar = await Isar.open(
      [ShiftLogSchema],
      directory: '',
      name: 'test_${DateTime.now().microsecondsSinceEpoch}',
    );
  });

  tearDown(() async {
    await isar.close(deleteFromDisk: true);
  });

  Future<void> addShift(DateTime clockIn) async {
    final shift = ShiftLog()
      ..clockIn = clockIn
      ..clockOut = clockIn.add(const Duration(hours: 8))
      ..breakMinutes = 0
      ..shiftType = ShiftType.normal
      ..basicHourlyRate = 10.0;
    await isar.writeTxn(() => isar.shiftLogs.put(shift));
  }

  test('monthly OT applies the 44h cap PER WEEK, not per month', () async {
    // Week 1: Jan 1-6 2024 (Mon-Sat) = 48h.
    for (var d = 1; d <= 6; d++) {
      await addShift(DateTime(2024, 1, d, 9, 0));
    }
    // Week 2: Jan 8-13 2024 (Mon-Sat) = 48h.
    for (var d = 8; d <= 13; d++) {
      await addShift(DateTime(2024, 1, d, 9, 0));
    }

    final container = ProviderContainer(
      overrides: [isarProvider.overrideWithValue(isar)],
    );
    addTearDown(container.dispose);

    final results = await container.read(
      monthlyOtSummaryProvider((year: 2024, month: 1)).future,
    );
    final total = results.fold(0.0, (s, r) => s + r.totalPay);

    // Each week: 44h × $10 + 4h × $10 × 1.5 = $500. Two weeks = $1000.
    // (If the cap were wrongly applied across the whole month, this would be
    // far higher.)
    expect(total, closeTo(1000.0, 0.01));
  });
}
