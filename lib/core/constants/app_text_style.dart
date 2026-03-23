// core/constants/app_text_styles.dart
import 'package:flutter/material.dart';
import 'package:future_hub/core/constants/app_sizes.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static TextStyle displayLg = GoogleFonts.notoSansThai(
    fontSize: AppSizes.displayLg,
    fontWeight: FontWeight.bold,
  );

  static TextStyle displayMd = GoogleFonts.notoSansThai(
    fontSize: AppSizes.displayMd,
    fontWeight: FontWeight.bold,
  );

  static TextStyle displaySm = GoogleFonts.notoSansThai(
    fontSize: AppSizes.displaySm,
    fontWeight: FontWeight.bold,
  );

  static TextStyle h1 = GoogleFonts.notoSansThai(
    fontSize: AppSizes.h1,
    fontWeight: FontWeight.bold,
  );

  static TextStyle h2 = GoogleFonts.notoSansThai(
    fontSize: AppSizes.h2,
    fontWeight: FontWeight.w700,
  );

  static TextStyle h3 = GoogleFonts.notoSansThai(
    fontSize: AppSizes.h3,
    fontWeight: FontWeight.w600,
  );

  static TextStyle h4 = GoogleFonts.notoSansThai(
    fontSize: AppSizes.h4,
    fontWeight: FontWeight.w500,
  );

  static TextStyle bodyLg = GoogleFonts.notoSansThai(
    fontSize: AppSizes.bodyLg,
    fontWeight: FontWeight.w400,
  );

  static TextStyle bodyMd = GoogleFonts.notoSansThai(
    fontSize: AppSizes.bodyMd,
    fontWeight: FontWeight.w400,
  );

  static TextStyle bodySm = GoogleFonts.notoSansThai(
    fontSize: AppSizes.bodySm,
    fontWeight: FontWeight.w400,
  );

  static TextStyle caption = GoogleFonts.notoSansThai(
    fontSize: AppSizes.caption,
    fontWeight: FontWeight.w400,
    color: Colors.grey,
  );

  static TextStyle button = GoogleFonts.notoSansThai(
    fontSize: AppSizes.button,
    fontWeight: FontWeight.w600,
  );
}
