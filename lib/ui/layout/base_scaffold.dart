import 'package:flutter/material.dart';

import '../styles/text.dart';
import '../styles/colors.dart';

class BaseScaffold extends StatelessWidget {
  final Function()? backButtonAction;
  final bool? isAppBar;
  final Widget body;
  final String? titleText;
  final PreferredSizeWidget? bottom;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final Color? backgroundColor;
  final Color? appbarBGColor;
  final bool? centerTitle;
  final bool? showBackBtn;
  final TextStyle? titleTextStyle;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final List<Widget>? actions;

  const BaseScaffold({
    Key? key,
    required this.body,
    this.titleText,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.backgroundColor,
    this.isAppBar,
    this.appbarBGColor,
    this.floatingActionButtonLocation,
    this.bottom,
    this.actions,
    // this.elevation = 0,
    this.backButtonAction,
    this.centerTitle,
    this.titleTextStyle,
    this.showBackBtn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: backgroundColor ?? AppColor.scaffoldBgColor,
      appBar: isAppBar == true ? getAppBar() : null,
      body: body,
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButtonLocation: floatingActionButtonLocation ??
          FloatingActionButtonLocation.centerDocked,
    );
  }

  PreferredSizeWidget? getAppBar() {
    return AppBar(
        elevation: 0,
        backgroundColor: appbarBGColor ?? AppColor.scaffoldBgColor,
        automaticallyImplyLeading: false,
        centerTitle: centerTitle ?? false,
        leading: showBackBtn == true? backButton(backButtonAction):null,
        title: Text(
          titleText ?? '',
          style: titleTextStyle ?? kAppBarTitleTextStyle,
        ),
        actions: actions,
        bottom: bottom);
  }

  Widget backButton(Function()? backAction) => Builder(
        builder: (context) {
          return GestureDetector(
            onTap: () => backAction!() ?? Navigator.maybePop(context),
            child: const Icon(
              Icons.chevron_left,
              color: AppColor.secondaryIconBtnBg,
            ),
          );
        },
      );
}
