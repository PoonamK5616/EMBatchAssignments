import 'package:flutter_test/flutter_test.dart';
import 'package:profile_card_assignment/main.dart';

void main() {
  testWidgets('ProfileCardApp builds and displays profile title', (WidgetTester tester) async {
    await tester.pumpWidget(const ProfileCardApp());
    expect(find.text('Profile Card'), findsOneWidget);
    expect(find.text('Ashutosh Rai'), findsOneWidget);
    expect(find.text('Flutter & Mobile App Developer'), findsOneWidget);
  });
}
