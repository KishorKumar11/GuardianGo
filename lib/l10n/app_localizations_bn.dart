// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get appName => 'GuardianGo';

  @override
  String get documentsMode => 'নথি';

  @override
  String get salaryMode => 'বেতন';

  @override
  String get evidenceMode => 'প্রমাণ';

  @override
  String get rightsMode => 'অধিকার';

  @override
  String get backupMode => 'ব্যাকআপ';

  @override
  String get scanDocument => 'নথি স্ক্যান করুন';

  @override
  String get scanRetry =>
      'স্পষ্টভাবে পড়া যাচ্ছে না — ভালো আলোতে আবার চেষ্টা করুন';

  @override
  String get offlineMessage =>
      'এই পদক্ষেপের জন্য ইন্টারনেট প্রয়োজন। স্ক্যান সংরক্ষিত হয়েছে।';

  @override
  String get momHotline => 'নিশ্চিত না? MOM কে কল করুন: 6438 5122';

  @override
  String get sensitiveWarning =>
      'আপনার নথির টেক্সট একটি নিরাপদ AI সেবায় পাঠানো হয়। আপনার ছবি কখনো পাঠানো হয় না।';

  @override
  String get biometricPrompt => 'প্রমাণ লকার খুলুন';

  @override
  String get exportQr => 'QR কোড হিসেবে রপ্তানি করুন';

  @override
  String get importQr => 'QR কোড থেকে আমদানি করুন';
}
