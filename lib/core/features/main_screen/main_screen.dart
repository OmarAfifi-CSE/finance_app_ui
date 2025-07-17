import 'package:finance_app_ui/core/features/auth/login_screen.dart';
import 'package:finance_app_ui/core/features/auth/register_screen.dart';
import 'package:finance_app_ui/core/features/main_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../styling/app_assets.dart';
import '../../styling/app_colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  List<Widget> screens = [
    LoginScreen(),
    RegisterScreen(),
    LoginScreen(),
    LoginScreen(),
    LoginScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(

        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.primaryColor,
        iconSize: 30.sp,

        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppAssets.homeIcon,
              width: 30.sp,
              height: 30.sp,
              colorFilter: currentIndex == 0
                  ? ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn)
                  : ColorFilter.mode(AppColors.grayColor, BlendMode.srcIn),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppAssets.chartIcon,
              width: 30.sp,
              height: 30.sp,
              colorFilter: currentIndex == 1
                  ? ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn)
                  : ColorFilter.mode(AppColors.grayColor, BlendMode.srcIn),
            ),
            label: 'Statistics',
          ),
          BottomNavigationBarItem(
            icon: Transform.translate(
              offset: Offset(0, 10.sp),
              child: Container(
                width: 48.sp,
                height: 48.sp,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryColor,
                ),
                alignment: Alignment.center,
                child: Container(
                  width: 20.sp,
                  height: 20.sp,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(4),
                    color: AppColors.whiteColor,
                  ),
                  child: Icon(
                    Icons.add,
                    color: AppColors.primaryColor,
                    size: 20.sp,
                  ),
                ),
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppAssets.walletIcon,
              width: 30.sp,
              height: 30.sp,
              colorFilter: currentIndex == 3
                  ? ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn)
                  : ColorFilter.mode(AppColors.grayColor, BlendMode.srcIn),
            ),
            label: 'My Cards',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppAssets.profileIcon,
              width: 30.sp,
              height: 30.sp,
              colorFilter: currentIndex == 4
                  ? ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn)
                  : ColorFilter.mode(AppColors.grayColor, BlendMode.srcIn),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
