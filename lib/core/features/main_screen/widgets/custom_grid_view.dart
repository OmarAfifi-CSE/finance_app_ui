import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../styling/app_assets.dart';
import 'custom_grid_item.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 360.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        child: GridView(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.w,
            mainAxisSpacing: 16.h,
            childAspectRatio: 156 / 140,
          ),
          children: [
            CustomGridItem(
              iconPath: AppAssets.sendIcon,
              title: 'Send Money',
              subtitle: 'Quickly and easily',
              onPressed: () {
                // Handle Statistics button press
              },
            ),
            CustomGridItem(
              iconPath: AppAssets.walletSolidIcon,
              title: 'Pay the bill',
              subtitle: 'Pay your bills',
              onPressed: () {
                // Handle Statistics button press
              },
            ),
            CustomGridItem(
              iconPath: AppAssets.sendIcon,
              title: 'Request',
              subtitle: 'Request money',
              onPressed: () {
                // Handle Statistics button press
              },
            ),
            CustomGridItem(
              iconPath: AppAssets.contactIcon,
              title: 'Contact',
              subtitle: 'Add a contact',
              onPressed: () {
                // Handle Statistics button press
              },
            ),
          ],
        ),
      ),
    );
  }
}
