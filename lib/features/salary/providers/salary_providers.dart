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
    return OtCalculator.calculateWeekly(shifts);
  },
);
