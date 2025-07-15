import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CustomBackButtonWidget extends StatelessWidget {
  const CustomBackButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 41.w,
      height: 41.h,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: Color(0xffE8EcF4), width: 1.w),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Center(
        child: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded, size: 20.r),
          onPressed: () {
            GoRouter.of(context).pop();
          },
          color: Color(0xff202955),
        ),
      ),
    );
  }
}
