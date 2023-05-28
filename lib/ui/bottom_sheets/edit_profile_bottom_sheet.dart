import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import '../styles/text.dart';
import '../widgets/buttons/base_button.dart';
import '../widgets/input/labeled_input.dart';
import 'base_bottom_sheet.dart';

class EditProfileBottomSheet extends StatefulWidget {
  final SheetRequest request;
  final Function(SheetResponse<SheetResponse>) completer;

  const EditProfileBottomSheet(
      {Key? key, required this.request, required this.completer})
      : super(key: key);

  @override
  State<EditProfileBottomSheet> createState() => _EditProfileBottomSheetState();
}

class _EditProfileBottomSheetState extends State<EditProfileBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var model = widget.request.data;
    return BaseBottomSheet(
      handleBarColor: const Color(0xFFE2E2E2),
      builder: (context, size) => Container(
        height: MediaQuery.of(context).size.height * 0.8,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(
                            Icons.close,
                            color: Colors.red,
                          )),
                      TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text(
                            'Save',
                            style: TextStyle(color: Colors.red),
                          ))
                    ],
                  ),
                  const Divider(),
                  const SizedBox(height: 140),
                  Column(
                    children: [
                      LabelInput(
                        labelText: 'First Name',
                        hintText: '${model.robotName}',
                        enableBorder: true,
                      ),
                      const LabelInput(
                        labelText: 'Any other field ',
                        hintText: 'Information',
                      ),
                      const LabelInput(
                        labelText: 'Any other field ',
                        hintText: 'Information',
                      ),
                      LabelInput(
                        labelText: 'Short Description',
                        hintText: '${model.shortDescription}',
                      ),
                    ],
                  ),
                  const SizedBox(height: 100),
                  BaseButton(
                    onPress: () {},
                    borderRadius: 4,
                    text: 'SAVE',
                  ),
                  const SizedBox(height: 45)
                ],
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 22,
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 72,
                      backgroundImage: NetworkImage("${model.imageUrl}"),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.camera_alt_outlined,
                            size: 26,
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Change Picture',
                            style: kBodyText1TextStyle.copyWith(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 7),
                    Text(
                      'Tap to change picture',
                      style: kBodyText1TextStyle.copyWith(
                          // color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class EditProfileBottomSheet extends StatefulWidget {
//   final SheetRequest request;
//   final Function(SheetResponse<SheetResponse>) completer;
//
//   const EditProfileBottomSheet(
//       {Key? key, required this.request, required this.completer})
//       : super(key: key);
//
//   @override
//   State<EditProfileBottomSheet> createState() => _EditProfileBottomSheetState();
// }
//
// class _EditProfileBottomSheetState extends State<EditProfileBottomSheet> {
//   static const Color successColor = Color(0xFF09CF87);
//   static const Color errorColor = Color(0xFFFE337B);
//   Color? fingerprintColor;
//
//   @override
//   Widget build(BuildContext context) {
//     return BaseBottomSheet(
//         handleBarColor: const Color(0xFFE2E2E2),
//         builder: (context, size) {
//           return Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(height:24),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                   child: Text(
//                     "Confirm Fingerprint",
//                     style: Theme.of(context).textTheme.headline3,
//                   ),
//                 ),
//                 const SizedBox(height:8),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                   child: Text(
//                     "Place your fingerprint to Sign In",
//                     style: Theme.of(context).textTheme.bodyText1,
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     if (fingerprintColor == null) {
//                       setState(() {
//                         fingerprintColor = successColor;
//                       });
//                     } else if (fingerprintColor == successColor) {
//                       setState(() {
//                         fingerprintColor = errorColor;
//                       });
//                     } else {
//                       widget.completer(SheetResponse(confirmed: true));
//                     }
//                   },
//                   child: Container(
//                     padding: const EdgeInsets.all(32.0),
//                     alignment: Alignment.center,
//                     child: SvgPicture.asset(
//                       AppSvgs.navicon4,
//                       height: 90,
//                       width: 90,
//                       color: fingerprintColor,
//                       colorBlendMode: BlendMode.modulate,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: InkWell(
//                     onTap: () =>
//                         widget.completer(SheetResponse(confirmed: false)),
//                     child: Text(
//                       "Cancel",
//                       style: Theme.of(context)
//                           .textTheme
//                           .button!
//                           .copyWith(color: Theme.of(context).primaryColor),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         });
//   }
// }
