import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../styling/app_assets.dart';
import '../../styling/app_styles.dart';
import '../../widgets/primary_button_widget.dart';

class PasswordChangedScreen extends StatelessWidget {
  const PasswordChangedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 248.h),
              Image.asset(AppAssets.rightCheckSticker, width: 100.w),
              SizedBox(height: 35.h),
              SizedBox(
                width: 292.w,
                child: Text(
                  "Password Changed!",
                  style: AppStyles.primaryHeadlineStyle.copyWith(
                    fontSize: 26.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 8.h),
              SizedBox(
                width: 292.w,
                child: Text(
                  "Your password has been changed successfully.",
                  style: AppStyles.subtitlesStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 40.h),
              PrimaryButtonWidget(
                buttonText: "Back to Login",
                onPressed: () {
                  GoRouter.of(context).pop();
                  GoRouter.of(context).pop();
                  GoRouter.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
