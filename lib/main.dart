import 'package:finance_app_ui/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/styling/app_themes.dart';
import 'core/widgets/primary_outlined_button_widget.dart';
import 'core/widgets/primary_button_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Finance UI',
          theme: AppThemes.lightTheme,
          home: child,
        );
      },
      child: const MyHomePage(title: 'Finance UI'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Center(
          child: Text(
            widget.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            PrimaryButtonWidget(buttonText: "Login", onPressed: () {}),
            SizedBox(height: 15.h),
            PrimaryOutlinedButtonWidget(
              buttonText: "Register",
              onPressed: () {},
            ),
            SizedBox(height: 30.h),
            CustomTextField(label: "Email", hintText: "Enter your email"),
            SizedBox(height: 15.h),
            CustomTextField(
              label: "Password",
              hintText: "Enter your password",
              suffixIcon: IconButton(
                icon: Icon(
                  isPassword
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: Color(0xff6A707C),
                ),
                onPressed: () {
                  setState(() {
                    isPassword = !isPassword;
                  });
                },
              ),
              obscureText: isPassword,
            ),
          ],
        ),
      ),
    );
  }
}
