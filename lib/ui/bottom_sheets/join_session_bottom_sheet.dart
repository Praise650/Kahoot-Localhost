import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import '../widgets/buttons/base_button.dart';
import '../widgets/input/labeled_input.dart';
import 'base_bottom_sheet.dart';

class JoinSessionBottomSheet extends StatelessWidget {
  final SheetRequest request;
  final Function(SheetResponse<SheetResponse>) completer;

  const JoinSessionBottomSheet({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var model = widget.request.data;
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
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.close,
                    color: Colors.red,
                  )),
            ),
            const Divider(),
            const SizedBox(height: 40),
                const LabelInput(
                  labelText: 'Input Session code',
                  hintText: '245367',
                  enableBorder: true,
                ),
            const SizedBox(height: 100),
            BaseButton(
              onPress: () {},
              borderRadius: 4,
              text: 'Join'.toUpperCase(),
            ),
            const SizedBox(height: 45),
          ],
        ),
      ),
    );
  }
}