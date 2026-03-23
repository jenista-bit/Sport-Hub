import 'package:flutter/material.dart';

abstract class AppColors {
  // สีหลักใหม่ตามธีม splash & login

  static const primary = Color(0xFF0D47A1); // น้ำเงินเข้มหลัก
  static const primaryDark = Color(0xFF042A6B); // เข้มสุดสำหรับ gradient
  static const primaryLight = Color(0xFF1976D2); // น้ำเงินอ่อนสำหรับ accent
  static const accent = Color(0xFF2196F3); // สีน้ำเงินสดสำหรับปุ่ม
  static const background = Colors.transparent; // ใช้ gradient แทน
  static const white = Color(0xFFFFFFFF); // ใช้ gradient แทน

  static const surface = Color(0xFF1E3A5F); // พื้นผิว semi-transparent
  static const textPrimary = Colors.white;
  static const textSecondary = Colors.white70;
  static const divider = Colors.white24;
  static const border = Colors.white38;
  static const error = Color(0xFFEF4444);
  static const success = Color(0xFF10B981);
  static const hintText = Color(0xFF9E9E9E);
  static const borderColor =Color(0xFFE0E0E0);
   static const black = Color(0xFF000000);

  /// PRIMARY BRAND

  /// BACKGROUND GRADIENT
  static const gradientTop = primaryLight;
  static const gradientMiddle = primary;
  static const gradientBottom = primaryDark;

  /// BORDER
  static const borderLight = Color(0x4DFFFFFF); // white30

  static const textHint = Colors.white60;

  /// ICON
  static const iconPrimary = Colors.white;
  static const iconSecondary = Colors.white70;
}
