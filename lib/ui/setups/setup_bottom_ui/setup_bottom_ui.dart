import 'package:stacked_services/stacked_services.dart';

import '../../../app/app_setup.locator.dart';
import '../../../core/enums/ui_setups/bottom_sheet_type.dart';
import '../../bottom_sheets/edit_profile_bottom_sheet.dart';

void setupBottomSheetUi() {
  final bottomSheetService = locator<BottomSheetService>();

  final builders = {
    BottomSheetType.editProfile: (context, sheetRequest,
            Function(SheetResponse<SheetResponse>) completer) =>
        EditProfileBottomSheet(
          request: sheetRequest,
          completer: completer,
        ),
  };

  bottomSheetService.setCustomSheetBuilders(builders);
}
