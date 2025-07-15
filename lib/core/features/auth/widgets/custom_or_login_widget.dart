import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../styling/app_styles.dart';

class CustomOrLoginWidget extends StatelessWidget {
  final String orText;

  const CustomOrLoginWidget({super.key, this.orText = "Or Login with"});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(color: Color(0xffE8ECF4), thickness: 1.h),
        ),
        SizedBox(width: 12.w),
        Text(
          orText,
          style: AppStyles.black16w600Style.copyWith(
            color: Color(0xff6A707C),
            fontSize: 14.sp,
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Divider(color: Color(0xffE8ECF4), thickness: 1.h),
        ),
      ],
    );
  }
}
