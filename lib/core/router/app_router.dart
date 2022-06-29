import 'package:flutter/material.dart';

class AppRouter {
  Future<T?> push<T>(BuildContext context, Widget widget) {
    return Navigator.of(context).push<T>(MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }
}
