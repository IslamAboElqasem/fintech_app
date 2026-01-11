import 'package:flutter/material.dart';

/// Application color palette
/// Organized by color families and usage categories
class AppColors {
  // Private constructor to prevent instantiation
  AppColors._();

  // ==================== PRIMARY PALETTE ====================

  /// Primary brand colors used for main UI elements
  static const Color primary = Color(0xFF1D3A70);
  static const Color twilightPurple = Color(0xFF1E1F4B);
  static const Color electricBlue = Color(0xFF4766F9);
  static const Color lighterCardGradient = Color(0xFF4F5962);
  static const Color cardGradient = Color(0xFF1D3A70);
  static const Color backGroundCard = Color(0xFF3A5489);
  static const Color scaffoldBackGroundDark = Color(0xFF121212);


  // ==================== NEUTRALS ====================

  /// Black shades - darkest to lightest
  static const Color darkerBlack = Color(0xFF1F1F1F);
  static const Color blackColor = Color(0xFF0D0D0D);
  static const Color obsidianBlack = Color(0xFF1A1A1A);
  static const Color inkBlack = Color(0xFF222222);
  static const Color onboardingBlack = Color(0xFF18191F);

  /// Gray shades - darkest to lightest
  static const Color darkGray = Color(0xFF494D58);
  static const Color smokeGray = Color(0xFF5D5C5D);
  static const Color stormGray = Color(0xFF787A8D);
  static const Color mediumGray = Color(0xFF8F8F8F);
  static const Color stoneGray = Color(0xFF949494);
  static const Color lightGray = Color(0xffCBD5E1);
  static const Color lighterGray = Color(0xff4F5962);

  /// White shades - darkest to lightest
  static const Color silverWhite = Color(0xFFF7F7F7);
  static const Color cloudWhite = Color(0xFFF5F8FE);
  static const Color snowWhite = Color(0xFFFFFFFF);

  // ==================== SEMANTIC COLORS ====================

  /// Success states and positive indicators
  static const Color successGreen = Color(0xCC00CB6A);
  static const Color seafoamGreen = Color(0xFF69D895);
  static const Color deepForest = Color(0xFF152C07);

  /// Error states and negative indicators
  static const Color errorRed = Color(0xCCF26666);
  static const Color redColor = Color(0xCCFF403B);

  /// Warning and alert states
  static const Color alertOrange = Color(0xFFF56C2A);

  // ==================== DATA VISUALIZATION ====================

  /// Chart and graph colors for financial data
  static const Color oceanTeal = Color(0xFF3CC3DF);
  static const Color lavenderPurple = Color(0xFF8979FF);
  static const Color coralPink = Color(0xFFFF928A);
}
