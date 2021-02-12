// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:quotes_app/widgets/add_journal_button.dart';

void main() {
  testWidgets('App', (WidgetTester tester) async {
    // Build our button and trigger a frame;
    // We need to wrap it since tooltip widgets
    // require an Overlay widget ancestor.
    await tester.pumpWidget(MaterialApp(
      home: AddJournalButton(),
    ));

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
  });
}
