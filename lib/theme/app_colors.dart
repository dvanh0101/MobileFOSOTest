import 'package:flutter/material.dart';

/// Bảng màu tạm cho các widget dùng chung. Thay bằng theme của dự án nếu đã có.
class AppColors {
  AppColors._();

  static const primary = Color(0xFF1F5EFF);
  static const primaryLight = Color(0xFFE6EEFF);
  static const price = Color(0xFFD7263D);
  static const warning = Color(0xFFFF8A00);
  static const warningLight = Color(0xFFFFF0DC);
  static const textPrimary = Color(0xFF1B1F2A);
  static const textSecondary = Color(0xFF9AA0AB);
  static const imageBg = Color(0xFFF3F4F7);
  static const appBarBlue = Color(0xFF0057C8);
  static const sheetColor = Color(0xFFF5F7FB);
  static const categorySb = Color(0xFFEAF2FF);
  static const divider = Color(0xFFEDEEF2);
  static const textHint = Color(0xFF0B4DA2);
}

Widget buildImage(String url, {BoxFit fit = BoxFit.cover}) {
  if (url.startsWith('http://') || url.startsWith('https://')) {
    return Image.network(
      url,
      fit: fit,
      errorBuilder: (_, __, ___) => const Center(
        child: Icon(Icons.image_outlined, color: AppColors.textSecondary),
      ),
    );
  } else {
    return Image.asset(
      url,
      fit: fit,
      errorBuilder: (_, __, ___) => const Center(
        child: Icon(Icons.image_outlined, color: AppColors.textSecondary),
      ),
    );
  }
}
