import 'package:flutter/material.dart';

class SCCard extends StatelessWidget {
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? bgColor;

  const SCCard({Key? key, this.child, this.padding, this.margin, this.bgColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin?? const EdgeInsets.only(top: 20, right: 11, left: 11),
      child: Card(
        elevation: 0,
        color: bgColor?? const Color(0xffFFFFFF),
        child: Padding(
          padding: padding ?? const EdgeInsets.all(8),
          child: child,
        ),
      ),
    );
  }
}
