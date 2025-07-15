import 'package:finance_app_ui/core/features/auth/widgets/custom_back_button_widget.dart';
import 'package:finance_app_ui/core/features/auth/widgets/custom_rich_text.dart';
import 'package:finance_app_ui/core/features/auth/widgets/custom_or_login_widget.dart';
import 'package:finance_app_ui/core/features/auth/widgets/custom_social_login_buttons.dart';
import 'package:finance_app_ui/core/widgets/primary_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../routing/app_routes.dart';
import '../../styling/app_styles.dart';
import '../../widgets/custom_text_form_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController usernameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 56.h),
                CustomBackButtonWidget(),
                SizedBox(height: 32.h),
                SizedBox(
                  width: 331.w,
                  child: Text(
                    "Hello! Register to get started",
                    style: AppStyles.primaryHeadlineStyle,
                  ),
                ),
                SizedBox(height: 32.h),
                CustomTextFormField(
                  label: 'Username',
                  hintText: 'Enter your username',
                  controller: usernameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Username cannot be empty';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12.h),
                CustomTextFormField(
                  label: 'Email',
                  hintText: 'Enter your Email',
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email cannot be empty';
                    }
                    // Add more email validation if needed
                    return null;
                  },
                ),
                SizedBox(height: 12.h),
                CustomTextFormField(
                  label: 'Password',
                  hintText: 'Enter your Password',
                  obscureText: true,
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password cannot be empty';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12.h),
                CustomTextFormField(
                  label: 'Confirm Password',
                  hintText: 'Please confirm your password',
                  obscureText: true,
                  controller: confirmPasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Confirm Password cannot be empty';
                    }
                    if (value != passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30.h),
                PrimaryButtonWidget(buttonText: 'Register', onPressed: () {
                  if (formKey.currentState!.validate()) {
                    // Handle registration logic here
                    print("Username: ${usernameController.text}");
                    print("Email: ${emailController.text}");
                    print("Password: ${passwordController.text}");
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Registration successful')),
                    );
                    GoRouter.of(context).pushReplacementNamed(AppRoutes.onboardingScreen);
                  }
                }),
                SizedBox(height: 35.h),
                CustomOrLoginWidget(orText: "Or Register with"),
                SizedBox(height: 22.h),
                CustomSocialLoginButtons(),
                SizedBox(height: 54.h),
                CustomRichText(
                  text: 'Already have an account? ',
                  onTapText: 'Login Now',
                  onTap: () {
                    GoRouter.of(
                      context,
                    ).pushReplacementNamed(AppRoutes.loginScreen);
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
