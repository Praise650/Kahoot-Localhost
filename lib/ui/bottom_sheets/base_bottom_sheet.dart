import 'package:flutter/material.dart';

class BaseBottomSheet extends StatelessWidget {
  final ContentBuilder builder;
  final bool showHandleBar;
  final Color? handleBarColor;
  final Color? backgroundColor;
  final bool hasScrollableChild;

  const BaseBottomSheet({
    Key? key,
    required this.builder,
    this.showHandleBar = true,
    this.handleBarColor,
    this.backgroundColor,
    this.hasScrollableChild = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    double normPadding = 8.0;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2.0),
      padding: hasScrollableChild
          ? EdgeInsets.only(
          top: normPadding, right: normPadding, left: normPadding)
          : EdgeInsets.all(normPadding),
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Builder(builder: (context) {
            Widget child = Container(
                constraints: BoxConstraints(minHeight: screen.height * 0.10),
                child: builder(context, screen));
            if (hasScrollableChild) {
              return Expanded(
                child: child,
              );
            } else {
              return child;
            }
          }),
        ],
      ),
    );
  }
}

typedef ContentBuilder = Widget Function(BuildContext context, Size screen);