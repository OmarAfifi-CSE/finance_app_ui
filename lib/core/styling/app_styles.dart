import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';
import 'app_fonts.dart';

class AppStyles {
  static TextStyle primaryHeadlineStyle = TextStyle(
    color: AppColors.primaryColor,
    fontFamily: AppFonts.mainFontName,
    fontSize: 30.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle subtitlesStyle = TextStyle(
    color: AppColors.secondaryColor,
    fontFamily: AppFonts.mainFontName,
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
  );
}
