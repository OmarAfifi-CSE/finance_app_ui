import 'package:finance_app_ui/core/styling/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProfileInfoTile extends StatelessWidget {
  const CustomProfileInfoTile({super.key, this.label, this.value});

  final String? label;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label ?? '',
          style: AppStyles.gray12w500Style.copyWith(
            fontSize: 14.sp,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          value ?? '',
          style: AppStyles.black16w600Style.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 16.h),
        const Divider(color: Color(0xffF2F2F5), height: 1),
      ],
    );
  }
}
