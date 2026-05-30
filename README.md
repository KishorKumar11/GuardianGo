# GuardianGo

A free, **offline-first** Flutter super app that protects migrant workers'
financial and legal rights in Singapore.

Migrant workers face three compounding problems: official documents they can't
read, overtime that goes underpaid, and workplace injuries that go undocumented.
GuardianGo addresses all three in one app that works without internet, costs
nothing, and keeps sensitive data encrypted on the device.

## Modules

| # | Module | Purpose | Connectivity |
|---|--------|---------|--------------|
| 1 | **Documents Explainer** | Scan + understand official English letters | LLM step only |
| 2 | **Salary Auditor** | Log shifts, calculate SG-legal OT disputes | Fully offline |
| 3 | **WICA Evidence Locker** | Securely document workplace injuries | Fully offline |
| 4 | **Rights Q&A** | Ask questions, get MOM-grounded answers | Fully offline |
| 5 | **P2P Backup** | Export encrypted evidence to a friend's phone | Fully offline |

## Architecture principles

- **Offline-first** — every module works in airplane mode (Documents degrades
  gracefully: OCR + translation run on-device, the LLM reasoning step queues).
- **Privacy by design** — images never leave the device; OCR text is PII-scrubbed
  before any network call; nothing goes to the cloud without explicit consent.
- **Encrypted local storage** — sensitive data stored in Isar with AES-256
  encryption; keys held in the platform secure enclave.
- **Clean architecture** — each feature is split into `domain/`, `data/`, and
  `presentation/`. Business logic stays out of widgets; Riverpod providers are
  the seam between layers.
- **i18n from day one** — all user-facing strings go through ARB files.
  Supported: English (en), Tamil (ta), Bengali (bn), Mandarin (zh).

## Tech stack

| Layer | Technology |
|-------|------------|
| Framework | Flutter (Dart) |
| State management | Riverpod |
| Local DB | Isar |
| Encryption | `encrypt` (AES-256) + `flutter_secure_storage` |
| OCR / Translation / Language ID | Google ML Kit (on-device) |
| LLM | Groq API (free tier) — Documents module only |
| Biometric auth | `local_auth` |
| PDF export | `pdf` |
| P2P backup | `qr_flutter` + `mobile_scanner` + custom chunker |
| Read-aloud | `flutter_tts` |

## Project structure

```
lib/
  core/          # constants, errors, crypto, connectivity, db, i18n
  features/
    documents/   # Documents Explainer  (domain / data / presentation / providers)
    salary/      # Salary Auditor
    evidence/    # WICA Evidence Locker
    rights/      # Rights Q&A
    backup/      # P2P QR Backup
  app.dart       # MaterialApp, router, locale
  main.dart      # Isar init, ProviderScope, biometric gate
```

## Getting started

Requires the [Flutter SDK](https://docs.flutter.dev/get-started/install)
(3.10+; developed against Flutter 3.44 / Dart 3.12).

```bash
flutter pub get
flutter test          # run the test suite
flutter run           # launch on a connected device or simulator
```

Code generation (Isar schemas, Riverpod) is run via:

```bash
dart run build_runner build --delete-conflicting-outputs
```

## Status

Early development — project scaffold and dependency set are in place. Modules are
being implemented phase by phase following a test-driven workflow.

## License

Not yet specified.
