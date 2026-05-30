// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appName => 'GuardianGo';

  @override
  String get documentsMode => '文件';

  @override
  String get salaryMode => '工资';

  @override
  String get evidenceMode => '证据';

  @override
  String get rightsMode => '权利';

  @override
  String get backupMode => '备份';

  @override
  String get scanDocument => '扫描文件';

  @override
  String get scanRetry => '无法清晰读取 — 请在更好的光线下重试';

  @override
  String get offlineMessage => '此步骤需要网络。扫描已保存待处理。';

  @override
  String get momHotline => '不确定？请拨打MOM: 6438 5122';

  @override
  String get sensitiveWarning => '您的文件文字将发送到安全的AI服务进行解释。您的照片永远不会发送。';

  @override
  String get biometricPrompt => '解锁证据保险箱';

  @override
  String get exportQr => '导出为QR码';

  @override
  String get importQr => '从QR码导入';
}
