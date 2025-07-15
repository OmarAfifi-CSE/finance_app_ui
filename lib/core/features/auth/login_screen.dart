import 'package:finance_app_ui/core/features/auth/widgets/custom_back_button_widget.dart';
import 'package:finance_app_ui/core/features/auth/widgets/custom_rich_text.dart';
import 'package:finance_app_ui/core/features/auth/widgets/custom_or_login_widget.dart';
import 'package:finance_app_ui/core/features/auth/widgets/custom_social_login_buttons.dart';
import 'package:finance_app_ui/core/styling/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../routing/app_routes.dart';
import '../../styling/app_colors.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../widgets/primary_button_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 20.h),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 56.h),
                CustomBackButtonWidget(),
                SizedBox(height: 28.h),
                SizedBox(
                  width: 280.w,
                  child: Text(
                    "Welcome back! Again!",
                    style: AppStyles.primaryHeadlineStyle,
                  ),
                ),
                SizedBox(height: 32.h),
                CustomTextFormField(
                  label: "Email",
                  hintText: "Enter your email",
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your email";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15.h),
                CustomTextFormField(
                  label: "Password",
                  hintText: "Enter your password",
                  obscureText: true,
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your email";
                    } else if (value.length < 6) {
                      return "Password must be at least 6 characters";
                    }
                    return null;
                  },
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
                    if (formKey.currentState!.validate()) {
                      // Handle login logic here
                      print("Email: ${emailController.text}");
                      print("Password: ${passwordController.text}");
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Login successful')),
                      );
                    }
                  },
                ),
                SizedBox(height: 35.h),
                CustomOrLoginWidget(),
                SizedBox(height: 22.h),
                CustomSocialLoginButtons(),
                SizedBox(height: 105.h),
                CustomRichText(
                  onTap: () {
                    GoRouter.of(
                      context,
                    ).pushReplacementNamed(AppRoutes.registerScreen);
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
