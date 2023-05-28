import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  final Widget child;
  final bool isChecked;
  final void Function()? onTap;

  const CustomCheckbox(
      {Key? key, required this.child, this.isChecked = false, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          InkWell(
            onTap: onTap,
            child: Icon(
              Icons.check_box,
              color: isChecked ? Theme.of(context).primaryColor : Colors.grey,
              size: 25,
            ),
          ),
          const SizedBox(width: 6),
          child
        ],
      ),
    );
  }
}
