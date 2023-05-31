import 'package:flutter/material.dart';
import 'package:kahoot_localhost/core/enums/ui_setups/bottom_sheet_type.dart';

import 'package:stacked_services/stacked_services.dart';

import '../../../app/app_setup.locator.dart';
import '../create_questions/create_questions.dart';

class SessionSelection extends StatelessWidget {
  SessionSelection({
    Key? key,
  }) : super(key: key);

  final bottomsheetService = locator<BottomSheetService>();
  final navigatorService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        children: ["Create", "Join"]
            .map((e) => Card(
                  child: InkWell(
                    onTap: () {
                      if (e == "Create") {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CreateQuestions(),
                          ),
                        );
                      } else {
                        bottomsheetService.showCustomSheet(
                            title: "Join",
                            description: "Please input session code",
                            takesInput: true,
                            variant: BottomSheetType.joinSession);
                      }
                    },
                    child: Text(
                      e.toUpperCase(),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
