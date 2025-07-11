import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../styling/app_assets.dart';
import 'custom_icon_button.dart';

class CustomSocialLoginButtons extends StatelessWidget {
  const CustomSocialLoginButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomIconButton(iconPath: AppAssets.facebookIcon, onPressed: () {}),
        SizedBox(width: 8.w),
        CustomIconButton(iconPath: AppAssets.googleIcon, onPressed: () {}),
        SizedBox(width: 8.w),
        CustomIconButton(iconPath: AppAssets.appleIcon, onPressed: () {}),
      ],
    );
  }
}
