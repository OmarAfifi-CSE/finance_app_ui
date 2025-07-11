import 'package:finance_app_ui/core/routing/router_generation_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Finance UI',
          theme: AppThemes.lightTheme,
          routerConfig: RouterGenerationConfig.goRouter,
        );
      },
    );
  }
}
