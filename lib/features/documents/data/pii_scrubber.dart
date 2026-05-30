import 'dart:convert';
import 'package:crypto/crypto.dart';

/// Removes personally identifiable information from OCR text before it is sent
/// to any network service, and hashes NRIC for use as a non-reversible DB key.
class PiiScrubber {
  PiiScrubber._();

  // Singapore NRIC/FIN: [STFGM] followed by 7 digits and a letter.
  static final _nricPattern = RegExp(r'[STFGM]\d{7}[A-Z]');

  // Singapore mobile numbers: start with 8 or 9, 8 digits total.
  static final _phonePattern = RegExp(r'\b[89]\d{7}\b');

  // Dollar amounts with optional commas / cents.
  static final _salaryPattern = RegExp(r'\$[\d,]+(?:\.\d{1,2})?');

  /// Scrubs known PII patterns from [text].
  static String scrub(String text) {
    var result = text;
    result = result.replaceAll(_nricPattern, '[ID_REDACTED]');
    result = result.replaceAll(_phonePattern, '[PHONE_REDACTED]');
    result = result.replaceAll(_salaryPattern, '[AMOUNT_REDACTED]');
    return result;
  }

  /// Returns the SHA-256 hex hash of an NRIC, for use as a DB key.
  static String hashNric(String nric) {
    final bytes = utf8.encode(nric.trim().toUpperCase());
    return sha256.convert(bytes).toString();
  }
}
