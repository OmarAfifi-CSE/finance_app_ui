import 'package:finance_app_ui/core/styling/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../styling/app_assets.dart';
import '../../../styling/app_colors.dart';

class CarouselCardWidget extends StatelessWidget {
  const CarouselCardWidget({super.key,
    this.backgroundColor = AppColors.primaryColor,
    this.cardName = 'X-Card',
    this.cardBalance = '23400 EG',
    this.cardNumber = '**** 3434',
    this.cardExpiry = '12/24',
  });
  final Color backgroundColor;
  final String cardName;
  final String cardBalance;
  final String cardNumber;
  final String cardExpiry;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 207.w,
      height: 263.h,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: FittedBox(
        child: Stack(
          children: [
            Positioned(
              bottom: 0.h,
              left: 0.w,
              child: SvgPicture.asset(
                AppAssets.ellipseImage,
                width: 187.w,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cardName,
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 47.h),
                  Text(
                    'Balance',
                    style: AppStyles.gray12w500Style.copyWith(
                      color: AppColors.whiteColor.withAlpha(100),
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    cardBalance,
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 50.h),
                  Row(
                    children: [
                      Text(
                        cardNumber,
                        style: AppStyles.gray12w500Style.copyWith(
                          color: AppColors.whiteColor.withAlpha(100),
                          fontSize: 16.sp,
                        ),
                      ),
                      SizedBox(width: 41.w),
                      Text(
                        cardExpiry,
                        style: AppStyles.gray12w500Style.copyWith(
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
