/// Will contain all extensions for the different types in the app
import 'package:flutter/material.dart';

// just to aid intellisense
class Ext {}

// extending the buildcontext to support responsive width and height to
extension CustomContext on BuildContext {
  double screenHeight(double percent) {
    return MediaQuery.of(this).size.height * (percent / 100);
  }

  double screenWidth(double percent) {
    return MediaQuery.of(this).size.width * (percent / 100);
  }

  void nextEditableTextFocus() {
    do {
      var foundFocusNode = FocusScope.of(this).nextFocus();
      if (!foundFocusNode) return;
    } while (
        FocusScope.of(this).focusedChild!.context!.widget is! EditableText);
  }
}