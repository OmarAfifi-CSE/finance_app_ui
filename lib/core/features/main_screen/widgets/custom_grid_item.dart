import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../styling/app_assets.dart';
import '../../../styling/app_colors.dart';
import '../../../styling/app_styles.dart';
import '../../auth/widgets/custom_icon_button.dart';

class CustomGridItem extends StatelessWidget {
  const CustomGridItem({
    super.key,
    this.iconPath,
    this.title,
    this.subtitle,
    this.onPressed,
  });

  final String? iconPath;
  final String? title;
  final String? subtitle;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 156.w,
      height: 140.h,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffE8EcF4)),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomIconButton(
            iconPath: iconPath ?? AppAssets.sendIcon,
            width: 48.w,
            height: 48.h,
            borderRadius: 12,
            borderWidth: 0,
            backgroundColor: const Color(0xffECF1F6),
            iconWidth: 20.w,
            iconHeight: 20.h,
            onPressed: onPressed,
          ),
          SizedBox(height: 12.h),
          Text(title ?? '', style: AppStyles.black16w600Style),
          SizedBox(height: 4.h),
          Text(subtitle ?? '', style: AppStyles.gray12w500Style),
        ],
      ),
    );
  }
}
