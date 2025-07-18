import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomIconButton extends StatelessWidget {
  final double? width;
  final double? height;
  final double? borderRadius;
  final double? borderWidth;
  final Color? backgroundColor;
  final void Function()? onPressed;
  final String iconPath;
  final double? iconWidth;
  final double? iconHeight;
  final Color? iconColor;

  const CustomIconButton({
    super.key,
    this.width,
    this.height,
    this.borderRadius,
    this.borderWidth,
    this.backgroundColor,
    this.onPressed,
    required this.iconPath,
    this.iconWidth,
    this.iconHeight,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 105.w,
      height: height ?? 56.h,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.transparent,
        border: Border.all(color: Color(0xffE8EcF4), width: borderWidth ?? 1.w),
        borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
      ),
      child: Center(
        child: IconButton(
          icon: SvgPicture.asset(
            iconPath,
            width: iconWidth ?? 26.w,
            height: iconHeight ?? 26.h,
            colorFilter: iconColor != null
                ? ColorFilter.mode(iconColor!, BlendMode.srcIn)
                : null,
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
