import 'package:flutter_test/flutter_test.dart';
import 'package:guardiago/features/salary/data/pdf_export_service.dart';
import 'package:guardiago/features/salary/domain/shift_log.dart';
import 'package:guardiago/features/salary/domain/ot_calculator.dart';

void main() {
  group('PdfExportService', () {
    test('generates non-empty PDF bytes', () async {
      final shifts = [
        ShiftLog()
          ..clockIn = DateTime(2024, 1, 15, 9, 0)
          ..clockOut = DateTime(2024, 1, 15, 17, 0)
          ..breakMinutes = 30
          ..shiftType = ShiftType.normal
          ..basicHourlyRate = 10.0,
      ];
      final results = shifts.map(OtCalculator.calculate).toList();
      final bytes = await PdfExportService.generateMonthlyReport(
        shifts: shifts,
        results: results,
        year: 2024,
        month: 1,
        workerName: 'Test Worker',
      );
      expect(bytes, isNotEmpty);
      // PDF files start with %PDF
      expect(String.fromCharCodes(bytes.take(4)), equals('%PDF'));
    });
  });
}
