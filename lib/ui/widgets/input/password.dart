import 'package:flutter/material.dart';

import 'general_input.dart';

class PasswordInput extends StatefulWidget {
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final String? hintText;

  const PasswordInput(
      {Key? key, this.validator, this.controller, this.hintText})
      : super(key: key);

  @override
  _PasswordInputState createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool show = true;

  @override
  Widget build(BuildContext context) {
    Widget _visibleWidget = show
        ? const Icon(
            Icons.visibility_off_outlined,
            color: Color(0xFF979797),
            key: ValueKey(1),
          )
        : const Icon(
            Icons.visibility_outlined,
            color: Color(0xFF979797),
            key: ValueKey(2),
          );

    return GeneralInput(
      hintText: widget.hintText ?? "Enter Password",
      isPassword: show,
      validator: widget.validator ??
          (value) {
            if (value!.isEmpty) {
              return 'Please enter some text';
            } else {
              return null;
            }
          },
      textInputAction: TextInputAction.done,
      controller: widget.controller,
      suffixIcon: IconButton(
        splashRadius: 27,
        icon: AnimatedSwitcher(
          child: _visibleWidget,
          duration: const Duration(milliseconds: 300),
        ),
        onPressed: () {
          setState(() {
            show = !show;
          });
        },
      ),
    );
  }
}
