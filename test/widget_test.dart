// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:spending_tracker/main.dart';
import 'package:spending_tracker/setup.dart';
import 'package:spending_tracker/widgets/home/home.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    setupServices();
    await tester.pumpWidget(MyApp());
    expect(find.byType(MyHomePage), findsOneWidget);
  });
}
