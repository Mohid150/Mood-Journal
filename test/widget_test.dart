import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:fifth_project/main.dart'; // Import your main file
import 'package:fifth_project/providers/mood_provider.dart'; // Import the provider

void main() {
  testWidgets('Mood Journal App Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (context) => MoodProvider(),
        child:  MyApp(),
      ),
    );

    // Add your test cases here
  });
}
