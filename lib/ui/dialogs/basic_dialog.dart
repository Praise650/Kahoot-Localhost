import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked_services/stacked_services.dart';

import '../styles/text.dart';

class BasicDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const BasicDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(height: 20),
            CircleAvatar(
              radius: 36,
              backgroundColor: request.data ?? Colors.white,
              child: SvgPicture.asset(
                request.imageUrl.toString(),
                alignment: Alignment.center,
                height: 60,
                width: 60,
              ),
            ),
            const SizedBox(height: 21),
            Text(
              request.title ?? "Request Title",
              style: kHeadline3TextStyle.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:30),
              child: Text(
                request.description ?? "Request Description",
                style: kBodyText1TextStyle.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),
            InkWell(
              onTap: ()=>completer(DialogResponse(confirmed: false)),
              child: const Text("OK"),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
