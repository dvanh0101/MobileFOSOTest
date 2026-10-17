import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';

/// Widget hiển thị ảnh thông minh: tự động xử lý cả URL mạng (http/https) lẫn đường dẫn tệp tài nguyên (assets/).
class AppNetworkImage extends StatelessWidget {
  final String url;
  final BoxFit fit;
  final double? width;
  final double? height;
  final Widget? errorWidget;

  const AppNetworkImage({
    super.key,
    required this.url,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    this.errorWidget,
  });

  @override
  Widget build(BuildContext context) {
    final fallback = errorWidget ??
        const Center(
          child: Icon(Icons.image_outlined, color: AppColors.textSecondary),
        );

    if (url.startsWith('http://') || url.startsWith('https://')) {
      return Image.network(
        url,
        width: width,
        height: height,
        fit: fit,
        errorBuilder: (_, __, ___) => fallback,
      );
    } else {
      return Image.asset(
        url,
        width: width,
        height: height,
        fit: fit,
        errorBuilder: (_, __, ___) => fallback,
      );
    }
  }
}
