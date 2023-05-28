import 'package:flutter/material.dart';

import 'password.dart';

class LabelPasswordInput extends StatelessWidget {
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final String labelText;

  const LabelPasswordInput(
      {Key? key, this.validator, this.controller, required this.labelText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: Theme.of(context).textTheme.headline4,
        ),
        const SizedBox(height: 12),
        PasswordInput(
          validator: validator,
          controller: controller,
        ),
        const SizedBox(height: 36),
      ],
    );
  }
}
