import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guardiago/core/db/isar_provider.dart';
import 'package:guardiago/features/salary/data/shift_repository.dart';
import 'package:guardiago/features/salary/domain/ot_calculator.dart';
import 'package:guardiago/features/salary/domain/shift_log.dart';

final shiftRepositoryProvider = Provider<ShiftRepository>((ref) {
  final isar = ref.watch(isarProvider);
  return ShiftRepository(isar);
});

final shiftsForMonthProvider =
    FutureProvider.family<List<ShiftLog>, ({int year, int month})>(
  (ref, args) async {
    final repo = ref.watch(shiftRepositoryProvider);
    return repo.getShiftsForMonth(args.year, args.month);
  },
);

final monthlyOtSummaryProvider =
    FutureProvider.family<List<OtResult>, ({int year, int month})>(
  (ref, args) async {
    final repo = ref.watch(shiftRepositoryProvider);
    final shifts = await repo.getShiftsForMonth(args.year, args.month);

    // The 44h cap is statutory PER WEEK, so group the month's shifts by their
    // ISO week before applying calculateWeekly to each week independently.
    final byWeek = <String, List<ShiftLog>>{};
    for (final shift in shifts) {
      final key = '${shift.clockIn.year}-W${shift.isoWeek}';
      byWeek.putIfAbsent(key, () => <ShiftLog>[]).add(shift);
    }

    return [
      for (final weekShifts in byWeek.values)
        ...OtCalculator.calculateWeekly(weekShifts),
    ];
  },
);
