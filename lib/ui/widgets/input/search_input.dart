import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../styles/colors.dart';

class SearchInput extends StatelessWidget {
  final String? hintText;
  final Widget? icon;
  final String? filterIconSvg;
  final void Function()? handleSearchCallback;

  const SearchInput(
      {Key? key,
        this.filterIconSvg,
        this.hintText,
        this.icon,
        this.handleSearchCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        // horizontal: 20,
          vertical: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.1), blurRadius: 7)
          ]),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              onEditingComplete: handleSearchCallback,
              textInputAction: TextInputAction.search,
              style: const TextStyle(color: AppColor.inputText, fontSize: 15),
              decoration: InputDecoration(
                  isCollapsed: true,
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 25, horizontal: 0),
                  hintStyle: const TextStyle(
                    fontSize: 15,
                    color: AppColor.inputPlaceholder,
                    fontWeight: FontWeight.w300,
                  ),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  hintText: hintText,
                  fillColor: Colors.white),
            ),
          ),
          GestureDetector(
            onTap: handleSearchCallback,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.primary,
              ),
              height: 40,
              width: 40,
              child: icon ?? buildDefaultSearchIcon(),
            ),
          )
        ],
      ),
    );
  }

  Widget buildDefaultSearchIcon() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Builder(builder: (context) {
        if (filterIconSvg != null) {
          return SvgPicture.asset(filterIconSvg!);
        } else {
          return const Icon(Icons.tune_rounded);
        }
      }),
    );
  }
}