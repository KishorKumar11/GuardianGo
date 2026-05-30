import 'package:guardiago/core/constants/app_constants.dart';
import 'package:guardiago/features/salary/domain/shift_log.dart';

/// Outcome of an overtime calculation for a single shift.
class OtResult {
  final double regularPay;
  final double otPay;
  final double totalPay;
  final double workedHours;
  final double otHours;

  const OtResult({
    required this.regularPay,
    required this.otPay,
    required this.workedHours,
    required this.otHours,
  }) : totalPay = regularPay + otPay;
}

/// Singapore Employment Act (Cap. 91) overtime math: daily 8h / weekly 44h
/// caps, 1.5× normal OT, 2.0× rest-day and public-holiday work. Pure Dart.
class OtCalculator {
  OtCalculator._();

  /// Calculate pay for a single shift.
  static OtResult calculate(ShiftLog shift) {
    if (shift.clockOut.isBefore(shift.clockIn)) {
      throw ArgumentError('clockOut must be after clockIn');
    }

    final totalMinutes = shift.clockOut.difference(shift.clockIn).inMinutes;
    final workedMinutes = totalMinutes - shift.breakMinutes;
    final workedHours = workedMinutes / 60.0;
    final rate = shift.basicHourlyRate;

    switch (shift.shiftType) {
      case ShiftType.restDay:
        // Entire shift at the rest-day multiplier.
        final pay = workedHours * rate * AppConstants.restDayMultiplier;
        return OtResult(
          regularPay: pay,
          otPay: 0.0,
          workedHours: workedHours,
          otHours: 0.0,
        );

      case ShiftType.publicHoliday:
        // Entire shift at the public-holiday multiplier.
        final pay = workedHours * rate * AppConstants.publicHolidayMultiplier;
        return OtResult(
          regularPay: pay,
          otPay: 0.0,
          workedHours: workedHours,
          otHours: 0.0,
        );

      case ShiftType.normal:
        final dailyCap = AppConstants.normalDailyHoursCap.toDouble();
        final regularHours = workedHours.clamp(0.0, dailyCap);
        final otHours = (workedHours - dailyCap).clamp(0.0, double.infinity);
        final regularPay = regularHours * rate;
        final otPay = otHours * rate * AppConstants.normalOtMultiplier;
        return OtResult(
          regularPay: regularPay,
          otPay: otPay,
          workedHours: workedHours,
          otHours: otHours,
        );
    }
  }

  /// Calculate pay for a list of shifts in the same week, applying the 44h/week
  /// cap on top of daily OT. Excess weekly hours are attributed to the latest
  /// normal shifts and re-priced at the OT multiplier.
  static List<OtResult> calculateWeekly(List<ShiftLog> shifts) {
    final results = shifts.map(calculate).toList();

    // Only NORMAL working hours count toward the 44h weekly cap. Rest-day and
    // public-holiday hours are separately compensated and must not inflate it.
    var totalRegularHours = 0.0;
    for (var i = 0; i < shifts.length; i++) {
      if (shifts[i].shiftType == ShiftType.normal) {
        totalRegularHours += results[i].workedHours;
      }
    }

    if (totalRegularHours <= AppConstants.normalWeeklyHoursCap) {
      return results;
    }

    final weeklyExcessHours =
        totalRegularHours - AppConstants.normalWeeklyHoursCap;

    var remainingExcess = weeklyExcessHours;
    final adjusted = List<OtResult>.from(results);

    for (var i = results.length - 1; i >= 0 && remainingExcess > 0; i--) {
      final shift = shifts[i];
      if (shift.shiftType != ShiftType.normal) continue;

      final original = results[i];
      final extraOtHours = remainingExcess.clamp(0.0, original.workedHours);
      remainingExcess -= extraOtHours;

      final newRegularHours = original.workedHours - extraOtHours;
      final newRegularPay = newRegularHours * shift.basicHourlyRate;
      final newOtPay = (original.otHours + extraOtHours) *
          shift.basicHourlyRate *
          AppConstants.normalOtMultiplier;

      adjusted[i] = OtResult(
        regularPay: newRegularPay,
        otPay: newOtPay,
        workedHours: original.workedHours,
        otHours: original.otHours + extraOtHours,
      );
    }

    return adjusted;
  }
}
