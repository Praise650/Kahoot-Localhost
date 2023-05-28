/// Will contain the basic button design widget that can be customized/built upon
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../styles/colors.dart';
import '../../styles/text.dart';


class BaseButton extends StatelessWidget {
  late final double borderRadius;
  final void Function() onPress;
  late final bool isOutlined;
  final String? text;
  final Widget? child;
  final IconData? icon;
  final String? svgIconAsset;
  late final Color bgColor;
  late final bool isSmall;
  late final Color borderColor;
  final TextStyle? textStyle;
  final bool disabled;
  final Color? iconColor;
  final bool isCircular;
  final bool isBusy;
  final double? minHeight;
  final EdgeInsets? padding;

  BaseButton.outlinedPrimary(
      {Key? key,
      required this.onPress,
      this.isCircular = false,
      this.child,
      this.minHeight,
      this.text,
      this.icon,
      this.isBusy = false,
      this.iconColor,
      this.svgIconAsset,
      this.isSmall = false,
      this.padding,
      this.textStyle = const TextStyle(color: AppColor.primary),
      this.disabled = false})
      :
        // assert(
        //     text != null && child != null && icon != null && svgAsset != null,
        //     'You must supply either text, child, icon or svgAsset'),
        super(key: key) {
    isOutlined = true;
    borderRadius = isSmall ? 12 : 30;
    bgColor = AppColor.primary.withOpacity(0.1);
    borderColor = AppColor.primary;
  }

  BaseButton.secondary(
      {Key? key,
      required this.onPress,
      this.text,
      this.isCircular = false,
      this.child,
      this.icon,
      this.minHeight,
      this.isBusy = false,
      this.iconColor,
      this.svgIconAsset,
      this.textStyle,
      this.padding,
      this.isSmall = false,
      this.disabled = false})
      : super(key: key) {
    bgColor = AppColor.secondarySwatch;
    borderColor = Colors.transparent;
    isOutlined = false;
    borderRadius = isSmall ? 12 : 30;
  }

  BaseButton.outlinedSecondary(
      {Key? key,
      required this.onPress,
      this.text,
      this.child,
      this.icon,
      this.minHeight,
      this.isBusy = false,
      this.isCircular = false,
      this.svgIconAsset,
      this.iconColor,
      this.padding,
      this.isSmall = false,
      this.textStyle = const TextStyle(color: AppColor.secondarySwatch),
      this.disabled = false})
      : super(key: key) {
    bgColor = AppColor.secondarySwatch.withOpacity(0.1);
    borderColor = AppColor.secondarySwatch;
    isOutlined = true;
    borderRadius = isSmall ? 12 : 30;
  }

  BaseButton.primaryAlt(
      {Key? key,
      required this.onPress,
      this.text,
      this.child,
      this.icon,
      this.minHeight,
      this.iconColor,
      this.isBusy = false,
      this.isCircular = false,
      this.svgIconAsset,
      this.padding,
      this.textStyle = const TextStyle(color: AppColor.primary),
      this.isSmall = false,
      this.bgColor = Colors.transparent,
      this.disabled = false})
      : super(key: key) {
    borderColor = AppColor.primary;
    isOutlined = true;
    borderRadius = isSmall ? 12 : 30;
  }

  BaseButton.secondaryAlt(
      {Key? key,
      required this.onPress,
      this.text,
      this.child,
      this.icon,
      this.iconColor,
      this.minHeight,
      this.isBusy = false,
      this.isCircular = false,
      this.svgIconAsset,
      this.padding,
      this.textStyle = const TextStyle(color: AppColor.secondarySwatch),
      this.bgColor = Colors.transparent,
      this.isSmall = false,
      this.disabled = false})
      : super(key: key) {
    borderColor = AppColor.secondarySwatch;
    isOutlined = true;
    borderRadius = isSmall ? 12 : 30;
  }

  /// BaseButton has the primary button Style in the Style Guide.
  /// Other style of buttons have named constructors.
  BaseButton({
    Key? key,
    required this.onPress,
    this.text,
    this.child,
    this.icon,
    this.isCircular = false,
    this.iconColor,
    this.isBusy = false,
    this.svgIconAsset,
    this.minHeight,
    this.padding,
    this.isSmall = false,
    this.textStyle = const TextStyle(color: Colors.white),
    this.isOutlined = false,
    this.disabled = false,
    this.bgColor = AppColor.primary,
    this.borderColor = AppColor.primary,
    double? borderRadius,
  }) : super(key: key) {
    this.borderRadius = borderRadius ?? (isSmall ? 12 : 30);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: disabled ? 0.7 : 1,
      duration: const Duration(milliseconds: 200),
      child: Material(
        color: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.all(4.0),
          constraints: BoxConstraints(minHeight: minHeight ?? 48),
          decoration: BoxDecoration(
            shape: isCircular ? BoxShape.circle : BoxShape.rectangle,
            borderRadius:
                isCircular ? null : BorderRadius.circular(borderRadius),
            border:
                isOutlined ? Border.all(width: 1, color: borderColor) : null,
            color: bgColor,
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(borderRadius),
            onTap: disabled ? null : onPress,
            child: Padding(
              padding: padding ??
                  EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: !isCircular ? 16 : 12),
              child: Row(
                mainAxisSize: isSmall ? MainAxisSize.min : MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Builder(builder: (context) {
                    if (isBusy) {
                      return SizedBox(
                        height: 28,
                        width: 28,
                        child: CircularProgressIndicator(
                          color: iconColor ??
                              (isOutlined ? borderColor : Colors.white),
                        ),
                      );
                    } else if (child != null) {
                      return child!;
                    } else if (icon != null) {
                      return Icon(
                        icon,
                        color: iconColor ??
                            (isOutlined && borderColor != Colors.transparent
                                ? borderColor
                                : Colors.white),
                      );
                    } else if (svgIconAsset != null) {
                      return SvgPicture.asset(
                        svgIconAsset!,
                        height: 24,
                        width: 24,
                        color: iconColor ??
                            (isOutlined && borderColor != Colors.transparent
                                ? borderColor
                                : null),
                        colorBlendMode: BlendMode.modulate,
                      );
                    } else {
                      return BtnText(
                        isSmall: isSmall,
                        text: text?.toUpperCase(),
                        style: textStyle,
                      );
                    }
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BtnText extends StatelessWidget {
  final String? text;
  final Color color;
  final bool isSmall;
  final TextStyle? style;

  const BtnText(
      {Key? key,
      required this.text,
      this.style,
      this.color = Colors.white,
      this.isSmall = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      style: kButtonTextStyle.merge(style),
    );
  }
}
