import 'package:flutter/material.dart';

Future<bool> onWillPop(context, {String? title, String? content}) async {
  return (await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(title ?? 'Are you sure?'),
          content: Text(content ?? 'Do you want to exit the App'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('No'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text('Yes'),
            ),
          ],
        ),
      )) ??
      false;
}
