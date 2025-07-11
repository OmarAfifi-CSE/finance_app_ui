import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../styling/app_assets.dart';

class CustomIconButton extends StatelessWidget {
  final double? width;
  final double? height;
  final double? borderRadius;
  final void Function()? onPressed;
  final String iconPath;
  const CustomIconButton({super.key,
    this.width,
    this.height,
    this.borderRadius,
    this.onPressed,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width??105.w,
      height: height??56.h,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: Color(0xffE8EcF4), width: 1.w),
        borderRadius: BorderRadius.circular(borderRadius??12.r),
      ),
      child: Center(
        child: IconButton(
          icon: SvgPicture.asset(
            iconPath,
            width: 26.w,
            height: 26.h,
          ),
          onPressed: onPressed,
          color: Color(0xff202955),
        ),
      ),
    );
  }
}
