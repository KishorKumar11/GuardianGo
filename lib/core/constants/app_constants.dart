class AppConstants {
  AppConstants._();

  // MOM contact
  static const String momHotline = '6438 5122';
  static const String momUrl = 'https://www.mom.gov.sg';
  static const String momAskUrl = 'https://ask.gov.sg/mom';

  // Groq
  static const String groqBaseUrl = 'https://api.groq.com/openai/v1';
  static const String groqModel = 'llama3-8b-8192';
  static const int groqMaxTokens = 1024;

  // OCR
  static const double ocrConfidenceThreshold = 0.6;

  // OT rates (Singapore Employment Act)
  static const double normalOtMultiplier = 1.5;
  static const double restDayMultiplier = 2.0;
  static const double publicHolidayMultiplier = 2.0;
  static const int normalDailyHoursCap = 8;
  static const int normalWeeklyHoursCap = 44;

  // QR backup
  static const int qrChunkSizeBytes = 1800;

  // Isar
  static const String isarDbName = 'guardiago_db';

  // Supported languages (ML Kit translation BCP-47 codes)
  static const Map<String, String> supportedLanguages = {
    'en': 'English',
    'ta': 'Tamil',
    'bn': 'Bengali',
    'zh': 'Mandarin',
    'hi': 'Hindi',
    'tl': 'Tagalog',
    'my': 'Burmese', // cloud fallback — no ML Kit on-device model
  };

  // Languages with no ML Kit on-device model (must use Groq translate step)
  static const Set<String> cloudOnlyLanguages = {'my'};
}
