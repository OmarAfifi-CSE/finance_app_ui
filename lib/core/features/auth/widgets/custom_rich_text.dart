import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../styling/app_styles.dart';

class CustomRichText extends StatelessWidget {
  final String? text;
  final String? onTapText;
  final VoidCallback? onTap;

  const CustomRichText({
    super.key,
    this.text = "Don't have an account? ",
    this.onTapText = "Register Now",
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: text,
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
            color: Color(0xff617AFD),
          ),
          children: [
            TextSpan(
              text: onTapText,
              style: AppStyles.primaryHeadlineStyle.copyWith(
                fontSize: 15.sp,
                fontWeight: FontWeight.w700,
                color: Color(0xff202955),
              ),
              recognizer: TapGestureRecognizer()..onTap = onTap ?? () {},
            ),
          ],
        ),
      ),
    );
  }
}
