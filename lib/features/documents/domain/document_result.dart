import 'package:isar/isar.dart';

part 'document_result.g.dart';

@collection
class DocumentResult {
  Id id = Isar.autoIncrement;

  /// SHA-256 hash of worker NRIC — used as lookup key, never raw NRIC.
  @Index()
  String? hashedNric;

  late DateTime createdAt;
  late String documentType;
  late String plainSummary;
  late List<String> actions;
  late List<String> deadlines;
  late List<String> rightsFlags;
  String? uncertainty;

  /// Translated summary in the user's language.
  String? translatedSummary;
  String? translatedLanguageCode;

  /// Whether this result is pending (offline queue).
  bool isPending = false;
}
