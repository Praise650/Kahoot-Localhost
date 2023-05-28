import 'package:flutter/material.dart';
import 'package:kahoot_localhost/utils/extensions.dart';

import '../../styles/colors.dart';


class GeneralInput extends StatelessWidget {
  final String? hintText;
  final bool isPassword;
  final bool? enableBorder;
  final TextInputType inputType;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;
  final Widget?  suffixIcon;
  final Color? fillColor;
  final String? initialValue;
  final void Function(String?)? onChanged;
  final TextEditingController? controller;

  final Widget? prefixIcon;

  const GeneralInput(
      {Key? key,
        this.hintText,
        this.isPassword = false,
        this.inputType = TextInputType.text,
        this.textInputAction = TextInputAction.next,
        this.validator,
        this.suffixIcon,
        this.onChanged,
        this.enableBorder,
        this.fillColor,
        this.controller, this.prefixIcon, this.initialValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputType,
      obscureText: isPassword,
      textInputAction: textInputAction,
      initialValue: initialValue,
      validator: validator??(value) {
        if (value!.isEmpty) {
          return 'Please enter some text';
        } else {
          return null;
        }
      },
      onChanged: onChanged,
      controller: controller,
      onEditingComplete: () {
        if (textInputAction == TextInputAction.next) {
          // context.nextEditableTextFocus();
        }
      },
      style: buildTextStyle(),
      cursorColor: AppColor.primary,
      decoration: buildInputDecoration(context),
    );
  }

  TextStyle buildTextStyle() {
    return const TextStyle(
      color: AppColor.inputText,
      fontSize: 15,
    );
  }

  InputDecoration buildInputDecoration(BuildContext context) {
    return InputDecoration(
      hintText: hintText?.toUpperCase(),
      suffixIcon: suffixIcon,
      filled: fillColor != null,
      prefixIcon: prefixIcon,
      fillColor: fillColor,
      contentPadding: EdgeInsets.symmetric(
          horizontal: context.screenWidth(3.5),
          vertical: context.screenHeight(2.45)
      ),
      hintStyle: buildHintStyle(),
      enabledBorder: enableBorder == true? buildEnabledBorder():null,
      focusedBorder:enableBorder == true? buildFocusedBorder():null,
      // errorBorder: buildErrorBorder(),
      // focusedErrorBorder: buildErrorBorder(),
    );
  }

  TextStyle buildHintStyle() {
    return const TextStyle(
        color: AppColor.inputPlaceholder,
        fontWeight: FontWeight.w300,
        fontSize: 15);
  }

  OutlineInputBorder buildEnabledBorder() {
    return OutlineInputBorder(
        borderSide: const BorderSide(color: AppColor.inputBorder, width: 0.5),
        borderRadius: BorderRadius.circular(10));
  }

  OutlineInputBorder buildFocusedBorder() {
    return OutlineInputBorder(
        borderSide: const BorderSide(color: AppColor.inputBorder, width: 0.7),
        borderRadius: BorderRadius.circular(10));
  }

  OutlineInputBorder buildErrorBorder() {
    return OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.error, width: 0.7),
        borderRadius: BorderRadius.circular(10));
  }
}