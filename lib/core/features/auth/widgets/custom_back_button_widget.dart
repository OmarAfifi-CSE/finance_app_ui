import 'package:finance_app_ui/core/styling/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    this.isSvg = false,
    this.svgPath = AppAssets.editSquareIcon,
  });

  final double? width;
  final double? height;
  final double? borderRadius;
  final IconData? icon;
  final Color? iconColor;
  final double? iconSize;
  final void Function()? onPressed;
  final bool isSvg;
  final String svgPath;

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
        child: isSvg
            ? SvgPicture.asset(svgPath, width: 22.w, height: 22.h)
            : IconButton(
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
