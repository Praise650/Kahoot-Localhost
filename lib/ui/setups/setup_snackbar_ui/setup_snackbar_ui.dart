import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app_setup.locator.dart';
import '../../../core/enums/ui_setups/snackbar_type.dart';

void setupSnackbarUi(){
  final snackbarService = locator<SnackbarService>();
  // Registers a config to be used when calling showSnackbar
  snackbarService.registerSnackbarConfig(SnackbarConfig(
      backgroundColor: Colors.white,
      textColor: Colors.red,
      mainButtonTextColor: Colors.black,
      messageColor: Colors.red));

  snackbarService.registerCustomSnackbarConfig(
    variant: SnackbarType.success,
    config: SnackbarConfig(
      backgroundColor: Colors.blueAccent,
      textColor: Colors.yellow,
      borderRadius: 1,
    ),
  );

  snackbarService.registerCustomSnackbarConfig(
    variant: SnackbarType.error,
    config: SnackbarConfig(
      backgroundColor: Colors.orange,
      titleColor: Colors.red,
      messageColor: Colors.red,
      borderRadius: 1,
    ),
  );
}