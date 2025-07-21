import 'package:finance_app_ui/core/widgets/primary_button_widget.dart';
import 'package:finance_app_ui/core/widgets/primary_outlined_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../routing/app_routes.dart';
import '../../styling/app_assets.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset(
                AppAssets.onboardingImage,
                width: 375.w,
                height: 570.h,
                fit: BoxFit.fill,
              ),
              SizedBox(height: 21.h),
              PrimaryButtonWidget(
                buttonText: "Login",
                onPressed: () {
                  GoRouter.of(context).pushNamed(AppRoutes.loginScreen);
                },
              ),
              SizedBox(height: 15.h),
              PrimaryOutlinedButtonWidget(
                buttonText: "Register",
                onPressed: () {
                  GoRouter.of(context).pushNamed(AppRoutes.registerScreen);
                },
              ),
              SizedBox(height: 46.h),
              GestureDetector(
                onTap: () {
                  // Handle guest login action
                },
                child: Text(
                  "Continue as a guest",
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff202955),
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
