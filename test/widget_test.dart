import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guardiago/app.dart';

void main() {
  testWidgets('app shell renders 5-tab navigation', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(child: GuardianGoApp()),
    );
    await tester.pumpAndSettle();

    // Bottom navigation with the five module destinations is present.
    expect(find.byType(NavigationBar), findsOneWidget);
    expect(find.byType(NavigationDestination), findsNWidgets(5));

    // Default tab (Documents) is shown.
    expect(find.text('Documents'), findsWidgets);
  });
}
