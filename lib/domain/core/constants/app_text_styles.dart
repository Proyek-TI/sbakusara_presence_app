import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  const AppTextStyle();

  static TextStyle get dateTextStyle => GoogleFonts.inter(
        fontSize: 14,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        height: 20 / 14,
        letterSpacing: 0.1,
      );

  static TextStyle get clockTextStyle => GoogleFonts.inter(
        fontSize: 12,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        height: 16 / 12,
        letterSpacing: 0.4,
      );

  static TextStyle get appBarTitleStyle => GoogleFonts.inter(
        fontSize: 24,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w700,
        height: 32 / 24,
        letterSpacing: 0,
      );

  static TextStyle get tileTitleStyle => GoogleFonts.inter(
        fontSize: 16,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        height: 24 / 16,
        letterSpacing: 0.15,
      );

  static TextStyle get bodyMediumStyle => GoogleFonts.inter(
        fontSize: 16,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        height: 24 / 16,
        letterSpacing: 0.15,
      );

  static TextStyle get subtitleTextStyle => GoogleFonts.inter(
        fontSize: 14,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        height: 20 / 14,
        letterSpacing: 0.25,
      );

  static TextStyle get helperinfoStyle => GoogleFonts.inter(
        fontSize: 10,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        height: 16 / 10,
        letterSpacing: 0.4,
      );

  static TextStyle get helperbodyHeadlineStyle => GoogleFonts.inter(
        fontSize: 14,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        height: 20 / 14,
        letterSpacing: 0.1,
      );

  static TextStyle get infoinOutStyle => GoogleFonts.inter(
        fontSize: 14,
        decoration: TextDecoration.none,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        height: 20 / 14,
        letterSpacing: 0.1,
      );
}
