import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:quizApp/core/services/quizService.dart';
import 'package:quizApp/ui/views/quizView/quizViewModel.dart';

final locator = GetIt.instance;

void setUp() {
  //! serivces
  locator.registerSingleton(QuizService());

  //! models
  locator.registerLazySingleton(() => QuizViewModel());
}
