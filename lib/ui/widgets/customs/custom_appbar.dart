import 'package:flutter/material.dart';

import '../back.dart';


class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String backIconSvg;
  final String? titleText;
  final PreferredSizeWidget? bottom;
  final void Function()? customBackBtnAction;

  const CustomAppBar({
    Key? key,
    required this.backIconSvg,
    this.titleText,
    this.bottom,
    this.customBackBtnAction,
  }) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>
      _PreferredAppBarSize(kToolbarHeight, bottom?.preferredSize.height);
}

class _PreferredAppBarSize extends Size {
  _PreferredAppBarSize(this.toolbarHeight, this.bottomHeight)
      : super.fromHeight(
      (toolbarHeight ?? kToolbarHeight) + (bottomHeight ?? 0));

  final double? toolbarHeight;
  final double? bottomHeight;
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 90,
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
        child: GestureDetector(
          onTap: widget.customBackBtnAction,
          child: AbsorbPointer(
            absorbing: widget.customBackBtnAction != null,
            child: LoginBackbutton(
              backIconSvg: widget.backIconSvg,
            ),
          ),
        ),
      ),
      title: widget.titleText != null
          ? Text(
        widget.titleText!,
      )
          : null,
      bottom: widget.bottom,
    );
  }
}