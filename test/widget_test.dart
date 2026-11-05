// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:barka/main.dart';

void main() {
  testWidgets('sign-in and registration screens are reachable',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Welcome Back'), findsOneWidget);

    final registerLink =
        find.text('New to New Beacon? Create an Account / Register');
    await tester.ensureVisible(registerLink);
    await tester.tap(registerLink);
    await tester.pumpAndSettle();

    expect(find.text('Create Portal Account'), findsOneWidget);

    final createAccountButton = find.text('Create School Account');
    await tester.ensureVisible(createAccountButton);
    await tester.tap(createAccountButton);
    await tester.pump();
    expect(
      find.text('Enter your name, a valid email, and a password'),
      findsOneWidget,
    );

    final signInLink = find.text('Already have an account? Sign In');
    await tester.ensureVisible(signInLink);
    await tester.tap(signInLink);
    await tester.pumpAndSettle();
    expect(find.text('Welcome Back'), findsOneWidget);
  });
}
