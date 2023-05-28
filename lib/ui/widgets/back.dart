import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PositionedLoginBackButton extends StatelessWidget {
  final String backIconSvg;

  const PositionedLoginBackButton({Key? key, required this.backIconSvg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        child: LoginBackbutton(
          backIconSvg: backIconSvg,
        ),
        top: 30,
        left: 20);
  }
}

class LoginBackbutton extends StatelessWidget {
  final String backIconSvg;

  const LoginBackbutton({Key? key, required this.backIconSvg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    handleBack() {
      Navigator.of(context).pop();
    }

    return InkWell(
        onTap: handleBack,
        borderRadius: BorderRadius.circular(10),
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromRGBO(149, 160, 252, 0.24),
            ),
            child: SvgPicture.asset(backIconSvg)));
  }
}