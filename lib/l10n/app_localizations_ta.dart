// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tamil (`ta`).
class AppLocalizationsTa extends AppLocalizations {
  AppLocalizationsTa([String locale = 'ta']) : super(locale);

  @override
  String get appName => 'GuardianGo';

  @override
  String get documentsMode => 'ஆவணங்கள்';

  @override
  String get salaryMode => 'சம்பளம்';

  @override
  String get evidenceMode => 'சான்று';

  @override
  String get rightsMode => 'உரிமைகள்';

  @override
  String get backupMode => 'காப்புப்பிரதி';

  @override
  String get scanDocument => 'ஆவணத்தை ஸ்கேன் செய்யுங்கள்';

  @override
  String get scanRetry =>
      'தெளிவாக படிக்க முடியவில்லை — நல்ல வெளிச்சத்தில் மீண்டும் முயற்சிக்கவும்';

  @override
  String get offlineMessage => 'இந்த படி இணையம் தேவை. ஸ்கேன் சேமிக்கப்பட்டது.';

  @override
  String get momHotline => 'உறுதியில்லையா? MOM ஐ அழையுங்கள்: 6438 5122';

  @override
  String get sensitiveWarning =>
      'உங்கள் ஆவணத்தின் உரை ஒரு பாதுகாப்பான AI சேவைக்கு அனுப்பப்படுகிறது. உங்கள் புகைப்படம் அனுப்பப்படுவதில்லை.';

  @override
  String get biometricPrompt => 'சான்று பெட்டியைத் திறக்கவும்';

  @override
  String get exportQr => 'QR குறியீடுகளாக ஏற்றுமதி செய்யுங்கள்';

  @override
  String get importQr => 'QR குறியீடுகளிலிருந்து இறக்குமதி செய்யுங்கள்';
}
