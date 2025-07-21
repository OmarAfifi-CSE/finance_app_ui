import 'package:finance_app_ui/core/features/auth/login_screen.dart';
import 'package:finance_app_ui/core/features/main_screen/home_screen.dart';
import 'package:finance_app_ui/core/features/main_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../styling/app_assets.dart';
import '../../styling/app_colors.dart';
import 'my_cards.dart';
import 'statistics_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // Controller to manage the PageView's state
  late PageController _pageController;
  int _currentIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    StatisticsScreen(),
    LoginScreen(),
    MyCards(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          onPageChanged: onPageChanged,
          padEnds: true,
          children: screens,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _pageController.jumpToPage(index);
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
              colorFilter: _currentIndex == 0
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
              colorFilter: _currentIndex == 1
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
              colorFilter: _currentIndex == 3
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
              colorFilter: _currentIndex == 4
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
