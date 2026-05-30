import 'package:flutter_test/flutter_test.dart';
import 'package:guardiago/features/salary/domain/shift_log.dart';
import 'package:guardiago/features/salary/domain/ot_calculator.dart';

ShiftLog makeShift({
  required DateTime clockIn,
  required DateTime clockOut,
  int breakMinutes = 0,
  ShiftType type = ShiftType.normal,
  double rate = 10.0,
}) =>
    ShiftLog()
      ..clockIn = clockIn
      ..clockOut = clockOut
      ..breakMinutes = breakMinutes
      ..shiftType = type
      ..basicHourlyRate = rate;

void main() {
  group('OtCalculator', () {
    final day = DateTime(2024, 1, 15, 9, 0); // Monday

    test('8-hour normal shift — no OT', () {
      final shift = makeShift(
        clockIn: day,
        clockOut: day.add(const Duration(hours: 8)),
      );
      final result = OtCalculator.calculate(shift);
      expect(result.regularPay, closeTo(80.0, 0.01));
      expect(result.otPay, closeTo(0.0, 0.01));
      expect(result.totalPay, closeTo(80.0, 0.01));
    });

    test('10-hour normal shift — 2h OT at 1.5x', () {
      final shift = makeShift(
        clockIn: day,
        clockOut: day.add(const Duration(hours: 10)),
      );
      final result = OtCalculator.calculate(shift);
      // Regular: 8h × $10 = $80
      // OT: 2h × $10 × 1.5 = $30
      expect(result.regularPay, closeTo(80.0, 0.01));
      expect(result.otPay, closeTo(30.0, 0.01));
      expect(result.totalPay, closeTo(110.0, 0.01));
    });

    test('8-hour normal shift with 1h break — no OT', () {
      final shift = makeShift(
        clockIn: day,
        clockOut: day.add(const Duration(hours: 9)),
        breakMinutes: 60,
      );
      final result = OtCalculator.calculate(shift);
      // Worked: 9h - 1h break = 8h, no OT
      expect(result.regularPay, closeTo(80.0, 0.01));
      expect(result.otPay, closeTo(0.0, 0.01));
    });

    test('Rest day 8-hour shift — 2.0x entire shift', () {
      final shift = makeShift(
        clockIn: day,
        clockOut: day.add(const Duration(hours: 8)),
        type: ShiftType.restDay,
      );
      final result = OtCalculator.calculate(shift);
      // 8h × $10 × 2.0 = $160
      expect(result.totalPay, closeTo(160.0, 0.01));
    });

    test('Public holiday 6-hour shift — 2.0x entire shift', () {
      final shift = makeShift(
        clockIn: day,
        clockOut: day.add(const Duration(hours: 6)),
        type: ShiftType.publicHoliday,
      );
      final result = OtCalculator.calculate(shift);
      // 6h × $10 × 2.0 = $120
      expect(result.totalPay, closeTo(120.0, 0.01));
    });

    test('Weekly OT cap: 44h worked, extra 4h at 1.5x', () {
      // Six 8-hour shifts = 48h. Daily cap not exceeded.
      // Weekly cap at 44h means 4 extra hours at OT rate.
      final shifts = List.generate(
        6,
        (i) => makeShift(
          clockIn: DateTime(2024, 1, 15 + i, 9, 0),
          clockOut: DateTime(2024, 1, 15 + i, 17, 0),
        ),
      );
      final results = OtCalculator.calculateWeekly(shifts);
      final totalPay = results.fold(0.0, (sum, r) => sum + r.totalPay);
      // 44h regular × $10 = $440
      // 4h OT × $10 × 1.5 = $60
      expect(totalPay, closeTo(500.0, 0.01));
    });

    test('rest-day hours do not count toward the 44h weekly cap', () {
      // 5 normal 8h shifts = 40h (under cap) + one 8h rest day shift.
      // Rest-day hours must NOT push normal hours over 44h.
      final shifts = [
        for (var i = 0; i < 5; i++)
          makeShift(
            clockIn: DateTime(2024, 1, 15 + i, 9, 0),
            clockOut: DateTime(2024, 1, 15 + i, 17, 0),
          ),
        makeShift(
          clockIn: DateTime(2024, 1, 20, 9, 0),
          clockOut: DateTime(2024, 1, 20, 17, 0),
          type: ShiftType.restDay,
        ),
      ];
      final results = OtCalculator.calculateWeekly(shifts);
      final totalPay = results.fold(0.0, (s, r) => s + r.totalPay);
      final totalOt = results.fold(0.0, (s, r) => s + r.otPay);
      // 40h normal × $10 = $400; rest day 8h × $10 × 2.0 = $160 → $560.
      // No weekly OT because normal hours (40) are under 44.
      expect(totalOt, closeTo(0.0, 0.01));
      expect(totalPay, closeTo(560.0, 0.01));
    });

    test('public holiday uses the public-holiday multiplier', () {
      final shift = makeShift(
        clockIn: day,
        clockOut: day.add(const Duration(hours: 8)),
        type: ShiftType.publicHoliday,
      );
      final result = OtCalculator.calculate(shift);
      expect(result.totalPay, closeTo(160.0, 0.01)); // 8h × $10 × 2.0
    });

    test('clock-out before clock-in throws ArgumentError', () {
      final shift = makeShift(
        clockIn: day.add(const Duration(hours: 8)),
        clockOut: day,
      );
      expect(() => OtCalculator.calculate(shift), throwsArgumentError);
    });
  });
}
