import 'package:flutter_test/flutter_test.dart';
import 'package:guardiago/features/documents/data/pii_scrubber.dart';

void main() {
  group('PiiScrubber', () {
    test('masks NRIC', () {
      const text = 'Worker NRIC: S1234567A must report to MOM.';
      final result = PiiScrubber.scrub(text);
      expect(result, isNot(contains('S1234567A')));
      expect(result, contains('[ID_REDACTED]'));
    });

    test('masks FIN number', () {
      const text = 'FIN: G1234567K is valid.';
      final result = PiiScrubber.scrub(text);
      expect(result, contains('[ID_REDACTED]'));
    });

    test('masks Singapore phone numbers', () {
      const text = 'Call 91234567 or 81234567 for help.';
      final result = PiiScrubber.scrub(text);
      expect(result, isNot(contains('91234567')));
      expect(result, contains('[PHONE_REDACTED]'));
    });

    test('masks salary dollar amounts', () {
      const text = 'Monthly salary is \$2,500 and OT is \$150.';
      final result = PiiScrubber.scrub(text);
      expect(result, isNot(contains('2,500')));
      expect(result, contains('[AMOUNT_REDACTED]'));
    });

    test('preserves non-PII content', () {
      const text = 'Your work permit expires on 31 December 2025.';
      final result = PiiScrubber.scrub(text);
      expect(result, contains('work permit'));
      expect(result, contains('31 December 2025'));
    });

    test('hashes NRIC correctly', () {
      const nric = 'S1234567A';
      final hash1 = PiiScrubber.hashNric(nric);
      final hash2 = PiiScrubber.hashNric(nric);
      expect(hash1, equals(hash2));
      expect(hash1, isNot(equals(nric)));
      expect(hash1.length, equals(64)); // SHA-256 hex = 64 chars
    });

    test('different NRICs produce different hashes', () {
      final h1 = PiiScrubber.hashNric('S1234567A');
      final h2 = PiiScrubber.hashNric('T9876543B');
      expect(h1, isNot(equals(h2)));
    });
  });
}
