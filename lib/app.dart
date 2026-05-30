import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guardiago/l10n/app_localizations.dart';
import 'package:guardiago/features/documents/presentation/documents_screen.dart';
import 'package:guardiago/features/salary/presentation/salary_screen.dart';
import 'package:guardiago/features/evidence/presentation/evidence_screen.dart';
import 'package:guardiago/features/rights/presentation/rights_screen.dart';
import 'package:guardiago/features/backup/presentation/backup_screen.dart';

class GuardianGoApp extends ConsumerWidget {
  const GuardianGoApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'GuardianGo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1B6CA8)),
        useMaterial3: true,
        textTheme: const TextTheme(
          // Large text for low-literacy users.
          bodyLarge: TextStyle(fontSize: 18),
          bodyMedium: TextStyle(fontSize: 16),
        ),
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('ta'),
        Locale('bn'),
        Locale('zh'),
      ],
      home: const MainShell(),
    );
  }
}

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _currentIndex = 0;

  final _screens = const [
    DocumentsScreen(),
    SalaryScreen(),
    EvidenceScreen(),
    RightsScreen(),
    BackupScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (i) => setState(() => _currentIndex = i),
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.document_scanner),
            label: l10n.documentsMode,
          ),
          NavigationDestination(
            icon: const Icon(Icons.attach_money),
            label: l10n.salaryMode,
          ),
          NavigationDestination(
            icon: const Icon(Icons.lock),
            label: l10n.evidenceMode,
          ),
          NavigationDestination(
            icon: const Icon(Icons.gavel),
            label: l10n.rightsMode,
          ),
          NavigationDestination(
            icon: const Icon(Icons.qr_code),
            label: l10n.backupMode,
          ),
        ],
      ),
    );
  }
}
