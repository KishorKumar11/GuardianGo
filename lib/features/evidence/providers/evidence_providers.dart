import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:guardiago/core/db/isar_provider.dart';
import 'package:guardiago/core/crypto/crypto_provider.dart';
import 'package:guardiago/features/evidence/data/biometric_service.dart';
import 'package:guardiago/features/evidence/data/encrypted_media_service.dart';
import 'package:guardiago/features/evidence/data/incident_repository.dart';
import 'package:guardiago/features/evidence/domain/incident_log.dart';

final biometricServiceProvider = Provider<BiometricService>((ref) {
  return BiometricService();
});

final encryptedMediaServiceProvider =
    FutureProvider<EncryptedMediaService>((ref) async {
  final crypto = await ref.watch(cryptoServiceProvider.future);
  final dir = await getApplicationDocumentsDirectory();
  return EncryptedMediaService(crypto: crypto, baseDir: dir.path);
});

final incidentRepositoryProvider = Provider<IncidentRepository>((ref) {
  return IncidentRepository(ref.watch(isarProvider));
});

final allIncidentsProvider = FutureProvider<List<IncidentLog>>((ref) async {
  return ref.watch(incidentRepositoryProvider).getAll();
});

/// Guards the Evidence Locker screen — returns true if authenticated.
final evidenceAuthProvider = FutureProvider<bool>((ref) async {
  final bio = ref.watch(biometricServiceProvider);
  return bio.authenticate('Unlock Evidence Locker');
});
