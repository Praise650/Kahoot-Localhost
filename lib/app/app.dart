import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

// import '../ui/setups/setup_bottom_ui/setup_bottom_ui.dart';
// import '../ui/setups/setup_dialog_ui/setup_dialog_ui.dart';
// import '../ui/setups/setup_snackbar_ui/setup_snackbar_ui.dart';

class App {
  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    await Hive.initFlutter();
    // setupLocator();
    // setupBottomSheetUi();
    // setupDialogUi();
    // setupSnackbarUi();
  }
}
