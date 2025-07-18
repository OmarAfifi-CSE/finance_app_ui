import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../styling/app_assets.dart';
import '../../../styling/app_styles.dart';
import '../../auth/widgets/custom_icon_button.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipOval(
          child: Image.asset(
            AppAssets.userIcon,
            width: 48.w,
            height: 48.h,
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(width: 10.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome back', style: AppStyles.gray12w500Style),
            SizedBox(height: 4.h),
            Text(
              'Omar Afifi',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Color(0xff1F2C37),
              ),
            ),
          ],
        ),
        Spacer(),
        CustomIconButton(
          iconPath: AppAssets.notificationIcon,
          width: 48.w,
          height: 48.h,
          iconWidth: 17.w,
          iconHeight: 20.h,
          borderRadius: 40.r,
          onPressed: () {},
        ),
      ],
    );
  }
}
