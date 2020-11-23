import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quizApp/core/models/quiz.dart';

class QuizService {
  QuizService() {
    getQuizzes();
  }

  List<Quiz> _quizzes = [];

  List<Quiz> get quizzes => _quizzes;

  Future getQuizzes() async {
    final response =
        await http.get("https://opentdb.com/api.php?amount=10&type=boolean");

    switch (response.statusCode) {
      case 200:
        _httpHandler(response.body);
        return "ok";
      case 404:
        return "page not found";
      default:
        return "uknown error";
    }
  }

  void _httpHandler(String body) {
    _quizzes.clear();

    final json = jsonDecode(body) as Map<String, dynamic>;

    json["results"].forEach((element) {
      String question = element["question"].replaceAll("&quot;", "\"");
      question = question.replaceAll("&#039;", "\'");

      _quizzes.add(Quiz(
          type: element["type"],
          category: element["category"],
          difficulty: element["difficulty"],
          question: question,
          answer: element["correct_answer"] == "True" ? true : false));
    });
  }
}
