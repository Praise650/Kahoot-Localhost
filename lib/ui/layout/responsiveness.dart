import 'package:flutter/material.dart';

import '../styles/dimens.dart';

class Responsiveness extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;
  const Responsiveness(
      {Key? key,
      required this.mobile,
      required this.tablet,
      required this.desktop})
      : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < Dimens.mobile;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < Dimens.tablet &&
      MediaQuery.of(context).size.width >= Dimens.mobile;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= Dimens.desktop;

  static double kSizeHeight(BuildContext context) =>
      MediaQuery.of(context).size.height / 528; //My design size is 528,

  static double kSizeWidth(BuildContext context) =>
      MediaQuery.of(context).size.height / 500; //My design size is 500,

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= Dimens.desktop) {
          return desktop;
        } else if (constraints.maxWidth > Dimens.mobile &&
            constraints.maxWidth < Dimens.desktop) {
          return tablet;
        } else {
          return mobile;
        }
      },
    );
  }
}
