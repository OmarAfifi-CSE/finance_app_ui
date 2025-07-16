import 'package:finance_app_ui/core/features/auth/widgets/custom_back_button_widget.dart';
import 'package:finance_app_ui/core/routing/app_routes.dart';
import 'package:finance_app_ui/core/widgets/primary_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../styling/app_colors.dart';
import '../../../styling/app_styles.dart';
import '../widgets/custom_rich_text.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController otpController;

  @override
  void initState() {
    super.initState();
    otpController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 20.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 12.h),
                  CustomBackButtonWidget(),
                  SizedBox(height: 28.h),
                  SizedBox(
                    width: 331.w,
                    child: Text(
                      "OTP Verification",
                      style: AppStyles.primaryHeadlineStyle,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(
                    width: 331.w,
                    child: Text(
                      "Enter the verification code we just sent on your email address.",
                      style: AppStyles.subtitlesStyle,
                    ),
                  ),
                  SizedBox(height: 32.h),
                  PinCodeTextField(
                    appContext: context,
                    length: 4,
                    controller: otpController,
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 4) {
                        return "Please enter the complete 4-digit OTP";
                      }
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.onUnfocus,
                    errorTextSpace: 20.h,
                    autoFocus: true,
                    enableActiveFill: true,
                    keyboardType: TextInputType.number,
                    textStyle: AppStyles.primaryHeadlineStyle.copyWith(
                      fontSize: 22.sp,
                    ),
                    cursorColor: AppColors.primaryColor,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(8.r),
                      fieldWidth: 70.w,
                      fieldHeight: 60.h,
                      inactiveFillColor: Color(0xffF7F8F9),
                      activeFillColor: AppColors.whiteColor,
                      selectedFillColor: AppColors.whiteColor,
                      inactiveColor: Color(0xffE8ECF4),
                      activeColor: AppColors.primaryColor,
                      selectedColor: AppColors.primaryColor,
                    ),
                    animationType: AnimationType.scale,

                    onCompleted: (value) {},
                  ),
                  SizedBox(height: 38.h),
                  PrimaryButtonWidget(
                    buttonText: 'Verify',
                    onPressed: () {
                      if (formKey.currentState?.validate() ?? false) {
                        // Handle OTP verification action
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('OTP verified successfully!')),
                        );
                        GoRouter.of(
                          context,
                        ).pushReplacementNamed(AppRoutes.resetPasswordScreen);
                      }
                    },
                  ),
                  SizedBox(height: 300.h),
                  CustomRichText(
                    text: "Didn't receive the code? ",
                    onTapText: 'Resend',
                    onTap: () {
                      // Handle resend OTP action
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('OTP resent successfully!')),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
