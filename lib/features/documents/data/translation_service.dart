import 'package:google_mlkit_translation/google_mlkit_translation.dart';
import 'package:guardiago/core/constants/app_constants.dart';
import 'package:guardiago/core/errors/app_error.dart';

/// On-device translation via ML Kit. Translates English explanations into the
/// worker's language, downloading the language model on first use. Languages
/// with no ML Kit model (e.g. Burmese) are rejected so the caller can fall back
/// to the cloud translate step.
class TranslationService {
  final OnDeviceTranslatorModelManager _modelManager =
      OnDeviceTranslatorModelManager();
  OnDeviceTranslator? _translator;

  /// Whether [languageCode] can be translated on-device.
  bool isSupportedOnDevice(String languageCode) {
    if (AppConstants.cloudOnlyLanguages.contains(languageCode)) return false;
    return BCP47Code.fromRawValue(languageCode) != null;
  }

  /// Ensures the model for [languageCode] is downloaded. Returns false if the
  /// language has no on-device model.
  Future<bool> ensureModelDownloaded(
    String languageCode, {
    bool wifiOnly = true,
  }) async {
    final lang = BCP47Code.fromRawValue(languageCode);
    if (lang == null ||
        AppConstants.cloudOnlyLanguages.contains(languageCode)) {
      return false;
    }
    if (await _modelManager.isModelDownloaded(lang.bcpCode)) return true;
    return _modelManager.downloadModel(lang.bcpCode, isWifiRequired: wifiOnly);
  }

  /// Translates [text] from [sourceLanguageCode] to [targetLanguageCode].
  /// Throws [TranslationFailure] for languages without an on-device model.
  Future<String> translate(
    String text, {
    required String targetLanguageCode,
    String sourceLanguageCode = 'en',
  }) async {
    final source = BCP47Code.fromRawValue(sourceLanguageCode);
    final target = BCP47Code.fromRawValue(targetLanguageCode);

    if (source == null ||
        target == null ||
        AppConstants.cloudOnlyLanguages.contains(targetLanguageCode)) {
      throw const AppError.translationFailure(
        'No on-device model for the requested language',
      );
    }

    await ensureModelDownloaded(targetLanguageCode);

    await _translator?.close();
    _translator = OnDeviceTranslator(
      sourceLanguage: source,
      targetLanguage: target,
    );
    return _translator!.translateText(text);
  }

  Future<void> dispose() async {
    await _translator?.close();
  }
}
