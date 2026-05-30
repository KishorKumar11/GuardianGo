import 'package:isar/isar.dart';

part 'incident_log.g.dart';

@collection
class IncidentLog {
  Id id = Isar.autoIncrement;

  @Index()
  late DateTime timestamp;

  double? latitude;
  double? longitude;

  /// Encrypted file paths (AES-256). Stored encrypted, never plaintext.
  late List<String> encryptedMediaPaths;

  /// Encrypted voice memo path
  String? encryptedVoiceNotePath;

  @Enumerated(EnumType.name)
  late IncidentCategory category;

  /// Encrypted notes field
  late String encryptedNotes;

  /// NTP-synced time at capture — stored for evidence integrity
  DateTime? ntpTimestamp;

  /// Whether NTP and device time differed significantly
  bool ntpDiscrepancy = false;

  /// Encrypted payload for QR/Bluetooth export
  String? encryptedSyncPayload;
}

enum IncidentCategory {
  injury,
  unsafeCondition,
  dispute,
  harassment,
  other,
}
