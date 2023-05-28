import 'package:flutter/material.dart';

/// Will contain all_orders the theme colors


class AppColor{

  static const int primaryColorValue = 0xFFFF0000;

  static Color error = const Color(0xFFE52836);
  static Color warning = const Color(0xFFF6A609);
  static Color success = const Color(0xFF2AC769);
  static const Color primary = Color(primaryColorValue);

  static const MaterialColor primarySwatch = MaterialColor(
  primaryColorValue,
  <int, Color>{
  50: Color(0xFFffe7e6),
  100: Color(0xFFffc7b8),
  200: Color(0xFFffa28a),
  300: Color(0xFFff795b),
  400: Color(0xFFff5436),
  500: Color(0xFFff200c),
  600: Color(0xFFff1507),
  700: Color(primaryColorValue),
  800: Color(0xFFf10000),
  900: Color(0xFFda0000),
  },
  );

  static const int secondaryColorValue = 0xFFFF3B30;

  static const MaterialColor secondarySwatch = MaterialColor(
  secondaryColorValue,
  <int, Color>{
  50: Color(0xFFffebee),
  100: Color(0xFFffcdd2),
  200: Color(0xFFf69999),
  300: Color(0xFFee7071),
  400: Color(0xfff94d4c),
  500: Color(secondaryColorValue),
  600: Color(0xFFf02f30),
  700: Color(0xFFde232a),
  800: Color(0xFFd11922),
  900: Color(0xFFc30014),
  },
  );

  static const Color scaffoldBgColor = Color(0xffE5E5E5);
  static const Color appBtnColor = primary;

  static Color primaryBtnBg = primarySwatch;
  static const Color primaryAltBtnBg = Color(0xFFFF3B30);
  static const Color secondaryAltBtnBg = Color(0xFFFF3B30);
  static const Color secondaryIconBtnBg = Color(0xFF1C1A1A);

  //Header texts, where black is required
  static const Color headlineTextPrimary = Color(0xFF3F3F3F);

  //Title texts, captions, inputs fields and everywhere else where black is required
  // static const Color textPrimary = Color(0xFF25282B);
  static const Color textPrimary = Color(0xFF000000);

  //text secondary
  static const Color textSecondary = Color(0xFF52575C);

  //inactive states
  static const Color textInactive = Color(0xFF52575C);

  // inputs fields
  static const Color inputText = Color(0xFF2F2F2F);

  //list dividers
  static const Color divider = Color(0xFFE8E8E8);

  static const Color inputBorder = Color(0xFFBBBBBB);

  static const Color inputBoxFillColor = Color(0xffFFFFFF);

  static const Color inputPlaceholder = Color(0xFF5E5E5E);

  static const Color onBoardingText = Color(0xFF000000);

  static const Color regularText = Color(0xFF040B45);

  static Color regularTextLight = const Color(0xFF040B45).withOpacity(0.7);

  static const Color normalText = Color(0xFF504F4F);

  static const Color normalTextLight = Color.fromRGBO(4, 11, 69, 0.61);

  static const Color normalExtraLight = Color(0xFF767676);

  static const Color checkboxInactive = Color(0xFFD9D9D9);

  static const Color errorLight = Color(0xFFFCF3F6);
  static const Color errorLightAlt = Color(0xFFF9DEE0);

  static const Color closeBg = Color(0xFFEDF0FF);

  static const Color divider2 = Color(0xFFE5E5E5);

  static const Color lightGray = Color.fromRGBO(4, 11, 69, 1);

  static const Color deepGreen = Color(0xFF176F53);

  static const Color bd2 = Color(0xFFECECEC);

  static const boxBorder = Color(0xFFFDFDFD);

  static const Color messageFieldColor = Color(0xFFFF5912);
  static const Color messageFieldColor2 = Color(0xffFFFFFF);
  static const Color lightBlue = Color(0xff279AED);
  static const Color cartDecoration = Color(0xFFF2F4FF);

  static const Color hintText = textInactive;
  static const Color iconColor = Color(0xffCCCCCC);
  static const Color homecardbgColor = Color(0xff096B91);
}