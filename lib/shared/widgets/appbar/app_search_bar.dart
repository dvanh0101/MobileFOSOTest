import 'package:flutter/material.dart';

/// Thanh tìm kiếm: icon kính lúp + hint + icon camera (tìm bằng hình ảnh).
class AppSearchBar extends StatelessWidget {
  const AppSearchBar({
    super.key,
    this.hintText = 'Tìm kiếm sản phẩm',
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.onCameraTap,
    this.readOnly = false,
  });

  final String hintText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;

  /// Dùng với readOnly = true để bấm vào mở màn hình tìm kiếm riêng.
  final VoidCallback? onTap;
  final VoidCallback? onCameraTap;
  final bool readOnly;

  static const _navy = Color(0xFF0B1F4B);
  static const _grey = Color(0xFF8E96A3);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: TextField(
        controller: controller,
        readOnly: readOnly,
        onTap: onTap,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        textInputAction: TextInputAction.search,
        style: const TextStyle(fontSize: 14, color: _navy),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 14, color: _grey),
          filled: true,
          fillColor: Colors.white,
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 10),
          prefixIcon: const Icon(Icons.search_rounded, color: _grey, size: 24),
          suffixIcon: IconButton(
            onPressed: onCameraTap,
            icon: const Icon(Icons.photo_camera_outlined,
                color: _navy, size: 24),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22),
            borderSide: const BorderSide(color: Color(0xFFE3E6EB)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22),
            borderSide: const BorderSide(color: _navy),
          ),
        ),
      ),
    );
  }
}