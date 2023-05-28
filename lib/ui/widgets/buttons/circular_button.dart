import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  const CircularButton({
    Key? key,
    this.iconData,
    this.btnColor,
    required this.onPress,
  }) : super(key: key);

  final IconData? iconData;
  final Color? btnColor;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: CircleAvatar(
        radius: 15,
        child: Icon(
          iconData,
          size: 20,
        ),
        backgroundColor: btnColor,
      ),
    );
  }
}
