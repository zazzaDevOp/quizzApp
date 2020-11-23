import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:quizApp/ui/shared/qColors.dart';
import 'package:quizApp/ui/views/baseView.dart';
import 'package:quizApp/ui/views/quizView/quizViewModel.dart';

class QuizView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<QuizViewModel>(builder: (context, model, child) {
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.refresh,
            color: QColors.secondary,
          ),
          backgroundColor: QColors.primary,
          onPressed: () => model.getNewQuizzes(),
        ),
        appBar: AppBar(
          backgroundColor: QColors.primary,
          title: Center(
            child: Text("Quiz App", style: TextStyle(color: Colors.white)),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 400,
              child: PageView.builder(
                  itemCount: model.quizzes.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(30),
                      decoration: BoxDecoration(
                          color: QColors.primaryLight,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Container(
                                    padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
                                    child: Text(model.quizzes[index].question,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold))),
                                Container(
                                    padding: const EdgeInsets.only(
                                        left: 20, bottom: 5),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                        "Category: ${model.quizzes[index].category}",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            color: QColors.secondary,
                                            fontStyle: FontStyle.italic))),
                                Container(
                                    padding: const EdgeInsets.only(left: 20),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                        "Difficulty:  ${model.quizzes[index].difficulty}",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            color: QColors.secondary,
                                            fontStyle: FontStyle.italic))),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                OutlineButton(
                                  borderSide:
                                      BorderSide(color: QColors.secondary),
                                  textColor: Colors.white,
                                  onPressed: () {
                                    if (model.quizzes[index].answer)
                                      _showSnackBar(context, "right");
                                    else
                                      _showSnackBar(context, "wrong");
                                  },
                                  child: Text("yes"),
                                ),
                                OutlineButton(
                                  borderSide:
                                      BorderSide(color: QColors.secondary),
                                  textColor: Colors.white,
                                  onPressed: () {
                                    if (!model.quizzes[index].answer)
                                      _showSnackBar(context, "right");
                                    else
                                      _showSnackBar(context, "wrong");
                                  },
                                  child: Text("no"),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      );
    });
  }

  Future _showSnackBar(BuildContext context, String text) => Flushbar(
        margin: EdgeInsets.all(8),
        barBlur: 10,
        backgroundColor: Colors.white,
        messageText: Text(
          text,
          style: TextStyle(color: QColors.primary),
        ),
        borderRadius: 10,
        flushbarPosition: FlushbarPosition.TOP,
        duration: Duration(seconds: 2),
      ).show(context);
}
