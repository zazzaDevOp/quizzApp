import 'package:flutter/material.dart';
import 'package:quizApp/locator.dart';
import 'package:quizApp/ui/shared/qColors.dart';
import 'package:quizApp/ui/views/quizView/quizView.dart';

void main() {
  setUp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: QColors.primary,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: QuizView());
  }
}
