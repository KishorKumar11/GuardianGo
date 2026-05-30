import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guardiago/app.dart';
import 'package:guardiago/core/db/isar_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final isar = await openIsar();

  runApp(
    ProviderScope(
      overrides: [
        isarProvider.overrideWithValue(isar),
      ],
      child: const GuardianGoApp(),
    ),
  );
}
