import 'package:finance_app_ui/core/features/auth/widgets/custom_back_button_widget.dart';
import 'package:finance_app_ui/core/features/auth/widgets/custom_rich_text.dart';
import 'package:finance_app_ui/core/widgets/primary_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../routing/app_routes.dart';
import '../../styling/app_styles.dart';
import '../../widgets/custom_text_form_field.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
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
                      "Forgot Password?",
                      style: AppStyles.primaryHeadlineStyle,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(
                    width: 331.w,
                    child: Text(
                      "Don't worry! It occurs. "
                      "Please enter the email address linked with your account.",
                      style: AppStyles.subtitlesStyle,
                    ),
                  ),
                  SizedBox(height: 32.h),
                  CustomTextFormField(
                    label: 'Enter your email',
                    hintText: 'Enter your email',
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      // Add more validation if needed
                      return null;
                    },
                  ),
                  SizedBox(height: 38.h),
                  PrimaryButtonWidget(
                    buttonText: 'Send Code',
                    onPressed: () {
                      if (formKey.currentState?.validate() ?? false) {
                        // Handle the send code action
                        // For example, you can navigate to the next screen
                        GoRouter.of(
                          context,
                        ).pushNamed(AppRoutes.otpVerificationScreen);
                      }
                    },
                  ),
                  SizedBox(height: 300.h),
                  CustomRichText(
                    text: 'Remember Password? ',
                    onTapText: 'Login',
                    onTap: () {
                      GoRouter.of(context).pop();
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
