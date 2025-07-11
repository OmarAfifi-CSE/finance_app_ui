import 'package:finance_app_ui/core/features/auth/widgets/back_button_widget.dart';
import 'package:finance_app_ui/core/features/auth/widgets/custom_donot_have_account.dart';
import 'package:finance_app_ui/core/features/auth/widgets/custom_or_login_widget.dart';
import 'package:finance_app_ui/core/features/auth/widgets/custom_social_login_buttons.dart';
import 'package:finance_app_ui/core/styling/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styling/app_colors.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/primary_button_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 56.h),
            BackButtonWidget(),
            SizedBox(height: 28.h),
            SizedBox(
              width: 280.w,
              child: Text(
                "Welcome back! Again!",
                style: AppStyles.primaryHeadlineStyle.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            SizedBox(height: 32.h),
            CustomTextField(label: "Email", hintText: "Enter your email"),
            SizedBox(height: 15.h),
            CustomTextField(
              label: "Password",
              hintText: "Enter your password",
              obscureText: true,
              suffixIcon: Icon(
                Icons.remove_red_eye,
                color: AppColors.grayColor,
              ),
            ),
            SizedBox(height: 15.h),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Forget Password?",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff6A707C),
                ),
              ),
            ),
            SizedBox(height: 30.h),
            PrimaryButtonWidget(
              buttonText: "Login",
              onPressed: () {
                // Handle login action
              },
            ),
            SizedBox(height: 35.h),
            CustomOrLoginWidget(),
            SizedBox(height: 22.h),
            CustomSocialLoginButtons(),
            SizedBox(height: 105.h),
            CustomDonotHaveAccount(),
          ],
        ),
      ),
    );
  }
}
