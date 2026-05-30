// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'GuardianGo';

  @override
  String get documentsMode => 'Documents';

  @override
  String get salaryMode => 'Salary';

  @override
  String get evidenceMode => 'Evidence';

  @override
  String get rightsMode => 'Rights';

  @override
  String get backupMode => 'Backup';

  @override
  String get scanDocument => 'Scan Document';

  @override
  String get scanRetry => 'Couldn\'t read clearly — try better lighting';

  @override
  String get offlineMessage =>
      'This step needs internet. Scan saved for later.';

  @override
  String get momHotline => 'Not sure? Call MOM: 6438 5122';

  @override
  String get sensitiveWarning =>
      'The text of your document is sent to a secure AI service to be explained. Your photo is never sent.';

  @override
  String get biometricPrompt => 'Unlock Evidence Locker';

  @override
  String get exportQr => 'Export as QR codes';

  @override
  String get importQr => 'Import from QR codes';
}
