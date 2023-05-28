import 'package:flutter/material.dart';

import '../../styles/colors.dart';

class CommentInputField extends StatelessWidget {
  const CommentInputField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 6,
      decoration: InputDecoration(
        hintText: "If you want to add any comment",
        hintStyle: const TextStyle(fontWeight: FontWeight.w300, fontSize: 14),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 0.5, color: AppColor.inputBorder)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 0.7, color: AppColor.primary)),
      ),
    );
  }
}