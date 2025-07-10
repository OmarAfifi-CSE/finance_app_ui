import 'package:finance_app_ui/core/styling/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styling/app_colors.dart';

class PrimaryOutlinedButtonWidget extends StatelessWidget {
  final String? buttonText;
  final Color? buttonColor;
  final double? width;
  final double? height;
  final double? borderRadius;
  final void Function()? onPressed;
  final bool isLoading;

  const PrimaryOutlinedButtonWidget({
    super.key,
    this.buttonText,
    this.buttonColor,
    this.width,
    this.height,
    this.borderRadius,
    this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: isLoading ? null : onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
        ),
        fixedSize: Size(width ?? 331.w, height ?? 56.h),
        textStyle: AppStyles.buttonTextStyle,
        side: BorderSide(color: AppColors.primaryColor, width: 1.w),
      ),
      child: isLoading
          ? CircularProgressIndicator(
              color: Theme.of(context).colorScheme.onPrimary,
            )
          : Text(buttonText ?? ""),
    );
  }
}
