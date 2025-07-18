import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../routing/app_routes.dart';
import '../../../styling/app_colors.dart';
import '../../auth/widgets/custom_back_button_widget.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  final IconData? leadingIcon;
  final IconData? actionsIcon;
  final double height;
  final bool isSvg;

  const CustomAppBar({
    super.key,
    required this.title,
    this.leadingIcon = Icons.arrow_back_ios_new_rounded,
    this.actionsIcon,
    this.height = 80.0,
    this.isSvg = false,
  });
  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 16.h),
        child: Container(
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomBackButtonWidget(
                width: 48.w,
                height: 48.h,
                borderRadius: 40.r,
                iconSize: 22.sp,
                icon: leadingIcon,
                iconColor: AppColors.blackColor,
                onPressed: () {
                  GoRouter.of(
                    context,
                  ).pushReplacementNamed(AppRoutes.mainScreen);
                },
              ),

              Text(
                title,
                style: TextStyle(
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                ),
              ),

              // Custom Actions Widget
              CustomBackButtonWidget(
                icon: actionsIcon ??Icons.more_horiz,
                width: 48.w,
                height: 48.h,
                borderRadius: 40.r,
                iconColor: AppColors.blackColor,
                iconSize: 30.sp,
                isSvg: isSvg,
                onPressed: () {
                  // Define your action here
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
