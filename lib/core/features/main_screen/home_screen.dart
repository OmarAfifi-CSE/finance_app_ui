import 'package:finance_app_ui/core/features/main_screen/widgets/carousel_widget.dart';
import 'package:finance_app_ui/core/features/main_screen/widgets/custom_grid_view.dart';
import 'package:finance_app_ui/core/features/main_screen/widgets/home_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: ClipRect(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 18.h,
                  ),
                  child: HomeHeaderWidget(),
                ),
                SizedBox(height: 24.h),
                Padding(
                  padding: EdgeInsets.only(left: 24.w),
                  child: CarouselWidget(),
                ),
                CustomGridView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
