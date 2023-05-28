import 'package:stacked_services/stacked_services.dart';

import '../../../app/app_setup.locator.dart';
import '../../../core/enums/ui_setups/dialog_type.dart';
import '../../dialogs/basic_dialog.dart';
import '../../dialogs/generic_dialog.dart';

void setupDialogUi(){
  final dialogService = locator<DialogService>();

  final builders = {
    DialogType.basic: (context, sheetRequest, completer) =>
        BasicDialog(request: sheetRequest, completer: completer),
    DialogType.generic: (context, sheetRequest,
        Function(DialogResponse<GenericDialogResponse>) completer) =>
        GenericDialog(request: sheetRequest, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}