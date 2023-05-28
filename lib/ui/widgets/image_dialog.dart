import 'package:flutter/material.dart';

Widget displayImage(final String link) => Builder(
      builder: (context) {
        return Container(
          color: Colors.black54,
          child: AlertDialog(
            backgroundColor: Colors.transparent,
            content: Image(
              image: NetworkImage(link),
              fit: BoxFit.fitWidth,
              height: MediaQuery.of(context).size.height * 1,
              width: MediaQuery.of(context).size.width * 0.5,
            ),
          ),
        );
      },
    );
