import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/features/screens/onboarding_screen.dart';
import 'core/styling/app_themes.dart';


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
      child: const OnboardingScreen(),
    );
  }
}
