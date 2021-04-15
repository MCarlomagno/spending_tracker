import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:spending_tracker/main.dart';
import 'package:spending_tracker/setup.dart';

void main() {
  testWidgets('show transaction form', (tester) async {
    setupServices();
    await tester.pumpWidget(MyApp());
    await tester.press(find.byIcon(Icons.add));
    await tester.pump();
    expect(find.text('Amount'), findsOneWidget);
    expect(find.text('Detail'), findsOneWidget);
  });
}
