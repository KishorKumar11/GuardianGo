import 'package:isar/isar.dart';

part 'shift_log.g.dart';

@collection
class ShiftLog {
  Id id = Isar.autoIncrement;

  @Index()
  late DateTime clockIn;
  late DateTime clockOut;

  /// Break duration in minutes
  late int breakMinutes;

  @Enumerated(EnumType.name)
  late ShiftType shiftType;

  /// Basic hourly rate in SGD
  late double basicHourlyRate;

  /// GPS — nullable (worker may deny location permission)
  double? latitude;
  double? longitude;

  /// Path to scanned timesheet image, if applicable
  String? ocrSourcePath;

  /// ISO week number for weekly OT cap tracking
  @ignore
  int get isoWeek {
    final jan4 = DateTime(clockIn.year, 1, 4);
    final startOfWeek1 = jan4.subtract(Duration(days: jan4.weekday - 1));
    return ((clockIn.difference(startOfWeek1).inDays) / 7).floor() + 1;
  }
}

enum ShiftType { normal, restDay, publicHoliday }
