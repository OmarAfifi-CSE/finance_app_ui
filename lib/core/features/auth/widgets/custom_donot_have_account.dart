import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../styling/app_styles.dart';

class CustomDonotHaveAccount extends StatelessWidget {
  const CustomDonotHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: "Don't have an account? ",
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
            color: Color(0xff617AFD),
          ),
          children: [
            TextSpan(
              text: "Register Now",
              style: AppStyles.primaryHeadlineStyle.copyWith(
                fontSize: 15.sp,
                fontWeight: FontWeight.w700,
                color: Color(0xff202955),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
