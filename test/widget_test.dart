import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/main.dart';

void main() {
  testWidgets('ContactPage renders all required widgets', (
    WidgetTester tester,
  ) async {
    // Set screen size for mobile preview (iPhone 14 / Pixel dimensions)
    tester.view.physicalSize = const Size(390 * 3, 844 * 3);
    tester.view.devicePixelRatio = 3.0;
    addTearDown(tester.view.resetPhysicalSize);

    // Build the app
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    // Verify Contact & Services title is rendered
    expect(find.text('Contact & Services'), findsOneWidget);
    expect(find.text('OUR SERVICES'), findsOneWidget);
    expect(find.text('QUICK CONTACT'), findsOneWidget);

    // Golden screenshot generation
    await expectLater(
      find.byType(MaterialApp),
      matchesGoldenFile('contact_page_screenshot.png'),
    );
  });
}
