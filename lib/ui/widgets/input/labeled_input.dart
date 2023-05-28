import 'package:flutter/material.dart';

import '../../styles/text.dart';
import 'general_input.dart';

class LabelInput extends StatelessWidget {
  final String labelText;
  final String hintText;

  final bool? enableBorder;

  const LabelInput({
    Key? key,
    required this.labelText,
    required this.hintText,
    this.enableBorder = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: kHeadline4TextStyle.copyWith(
              fontWeight: FontWeight.w700, fontSize: 16),
          // style: Theme.of(context).textTheme.headline4,
        ),
        const SizedBox(
          height: 12,
        ),
        GeneralInput(
          hintText: hintText,
          enableBorder: enableBorder,
        ),
        const SizedBox(
          height: 36,
        ),
      ],
    );
  }
}
