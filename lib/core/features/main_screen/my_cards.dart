import 'package:finance_app_ui/core/features/auth/widgets/custom_back_button_widget.dart';
import 'package:finance_app_ui/core/features/main_screen/widgets/carousel_card_widget.dart';
import 'package:finance_app_ui/core/features/main_screen/widgets/custom_app_bar.dart';
import 'package:finance_app_ui/core/features/main_screen/widgets/custom_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../routing/app_routes.dart';
import '../../styling/app_colors.dart';

class MyCards extends StatelessWidget {
  const MyCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'All Cards'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        child: Center(
          child: Column(
            children: [
              const CustomCardWidget(),
              SizedBox(height: 24.h),
              const CustomCardWidget(
                backgroundColor: Color(0xff4151A6),
                cardName: 'M-Card',
                cardBalance: '3209 EG',
                cardNumber: '**** 4545',
                cardExpiry: '07/28',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
