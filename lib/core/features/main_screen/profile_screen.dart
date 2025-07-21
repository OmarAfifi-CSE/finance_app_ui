import 'package:finance_app_ui/core/features/main_screen/widgets/custom_app_bar.dart';
import 'package:finance_app_ui/core/features/main_screen/widgets/custom_profile_info_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styling/app_assets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'My Profile', isSvg: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 20.h),
                SizedBox(
                  width: 150.w,
                  height: 150.h,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(AppAssets.userIcon),
                    backgroundColor: Colors.transparent,
                  ),
                ),
                SizedBox(height: 12.h),
                CustomProfileInfoTile(label: 'Name', value: 'Omar Afifi'),
                SizedBox(height: 16.h),
                CustomProfileInfoTile(
                  label: 'Email',
                  value: 'omarafifi.cse@gmail.com',
                ),
                SizedBox(height: 16.h),
                CustomProfileInfoTile(
                  label: 'Phone Number',
                  value: '+20 123 456 7890',
                ),
                SizedBox(height: 16.h),
                CustomProfileInfoTile(label: 'Address', value: 'Cairo, Egypt'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
