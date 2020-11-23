import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizApp/locator.dart';

class BaseView<T extends ChangeNotifier> extends StatelessWidget {
  BaseView({this.builder, this.child});

  final Function(BuildContext, T, Widget) builder;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: locator<T>(),
      child: Consumer<T>(
        builder: builder,
        child: child,
      ),
    );
  }
}
