import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../styling/app_colors.dart';

class CustomBackButtonWidget extends StatelessWidget {
  const CustomBackButtonWidget({
    super.key,
    this.width,
    this.height,
    this.borderRadius,
    this.icon,
    this.iconColor,
    this.iconSize,
    this.onPressed,
  });

  final double? width;
  final double? height;
  final double? borderRadius;
  final IconData? icon;
  final Color? iconColor;
  final double? iconSize;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 41.w,
      height: height ?? 41.h,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: Color(0xffE8EcF4), width: 1.w),
        borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
      ),
      child: Center(
        child: IconButton(
          icon: Icon(
            icon ?? Icons.arrow_back_ios_new_rounded,
            size: iconSize ?? 20.sp,
          ),
          onPressed:
              onPressed ??
              () {
                GoRouter.of(context).pop();
              },
          color: iconColor ?? AppColors.primaryColor,
        ),
      ),
    );
  }
}
