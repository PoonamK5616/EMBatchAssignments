import 'package:flutter_test/flutter_test.dart';
import 'package:my_first_flutter_app/main.dart';

void main() {
  testWidgets('Bite app loads dashboard', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.text('Bite'), findsWidgets);
    expect(find.text('Dashboard'), findsOneWidget);
    expect(find.text('Orders'), findsWidgets);
  });
}
