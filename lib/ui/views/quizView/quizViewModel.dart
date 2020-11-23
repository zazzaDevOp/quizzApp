import 'package:flutter/material.dart';
import 'package:quizApp/core/models/quiz.dart';
import 'package:quizApp/core/services/quizService.dart';
import 'package:quizApp/locator.dart';

class QuizViewModel extends ChangeNotifier {
  final _quizService = locator<QuizService>();

  List<Quiz> get quizzes => _quizService.quizzes;

  void getNewQuizzes() async {
    final response = await _quizService.getQuizzes();
    if (response == "ok")
      notifyListeners();
    else
      print(response);
  }
}
