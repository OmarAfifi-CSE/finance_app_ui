import 'package:finance_app_ui/core/features/auth/widgets/custom_back_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../routing/app_routes.dart';
import '../../styling/app_styles.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../widgets/primary_button_widget.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController newPasswordController;
  late TextEditingController confirmPasswordController;

  @override
  void initState() {
    super.initState();
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 20.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 56.h),
                CustomBackButtonWidget(),
                SizedBox(height: 28.h),
                SizedBox(
                  width: 331.w,
                  child: Text(
                    "Create New Password",
                    style: AppStyles.primaryHeadlineStyle,
                  ),
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  width: 331.w,
                  child: Text(
                    "Your new password must be unique from those previously used.",
                    style: AppStyles.subtitlesStyle,
                  ),
                ),
                SizedBox(height: 32.h),
                CustomTextFormField(
                  label: 'New Password',
                  hintText: 'Enter your new password',
                  obscureText: true,
                  controller: newPasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your new password";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15.h),
                CustomTextFormField(
                  label: 'Confirm Password',
                  hintText: 'Re-enter your new password',
                  obscureText: true,
                  controller: confirmPasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please confirm your password";
                    }
                    if (value != newPasswordController.text) {
                      return "Passwords do not match";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 38.h),
                PrimaryButtonWidget(
                  buttonText: 'Reset Password',
                  onPressed: () {
                    if (formKey.currentState?.validate() ?? false) {
                      // Handle password creation logic here
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Password has been reset successfully!',
                          ),
                        ),
                      );
                      GoRouter.of(
                        context,
                      ).pushNamed(AppRoutes.passwordChangedScreen);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
