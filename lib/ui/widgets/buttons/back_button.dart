import 'package:flutter/material.dart';

Widget backButton(Function()? backButtonAction){
  return Container(
    width: 40,
    height: 50,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: const Color(0xff95A0FC),
    ),
    child: BackButton(onPressed: backButtonAction)
  );
}