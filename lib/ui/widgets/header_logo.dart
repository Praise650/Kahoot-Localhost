import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../app/res/svgs.dart';
import '../styles/colors.dart';
import '../styles/text.dart';


class TemplateLogo extends StatelessWidget {
  const TemplateLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(AppSvgs.applogobot,height: 55,),
        const SizedBox(height: 8),
        Text('AipalBot',
            style:
            kHeadline1TextStyle.copyWith(color: AppColor.primary)),
        const SizedBox(height: 2),
        Text(
          'connecting people robotically...',
          style:
          kSubtitle1TextStyle.copyWith(fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
