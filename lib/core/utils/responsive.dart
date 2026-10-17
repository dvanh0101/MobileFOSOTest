import 'package:flutter/material.dart';

/// Các mốc kích thước (đơn vị dp, không phải pixel).
class Breakpoints {
  Breakpoints._();

  static const double smallPhone = 360; // < 360: điện thoại nhỏ (iPhone SE, máy cũ)
  static const double tablet = 600; // >= 600: tablet, foldable, điện thoại xoay ngang
  static const double desktop = 1000; // >= 1000: tablet lớn
  static const double shortHeight = 480; // < 480: chiều cao thấp (điện thoại xoay ngang)
}

enum ScreenSize { smallPhone, phone, tablet, desktop }

extension ResponsiveContext on BuildContext {
  Size get screenDimensions => MediaQuery.sizeOf(this);
  double get screenWidth => screenDimensions.width;
  double get screenHeight => screenDimensions.height;

  ScreenSize get screenSize {
    final w = screenWidth;
    if (w >= Breakpoints.desktop) return ScreenSize.desktop;
    if (w >= Breakpoints.tablet) return ScreenSize.tablet;
    if (w < Breakpoints.smallPhone) return ScreenSize.smallPhone;
    return ScreenSize.phone;
  }

  bool get isSmallPhone => screenSize == ScreenSize.smallPhone;
  bool get isPhone =>
      screenSize == ScreenSize.phone || screenSize == ScreenSize.smallPhone;
  bool get isTablet => screenSize == ScreenSize.tablet;
  bool get isDesktop => screenSize == ScreenSize.desktop;

  bool get isLandscape =>
      MediaQuery.orientationOf(this) == Orientation.landscape;

  /// Số cột gợi ý cho GridView theo kích thước màn hình.
  int get gridColumns {
    switch (screenSize) {
      case ScreenSize.smallPhone:
      case ScreenSize.phone:
        return 2;
      case ScreenSize.tablet:
        return 3;
      case ScreenSize.desktop:
        return 4;
    }
  }
}

/// Giới hạn bề rộng nội dung và căn giữa trên màn hình lớn.
/// Bọc `body` của màn hình bằng widget này.
class ResponsiveCenter extends StatelessWidget {
  const ResponsiveCenter({
    super.key,
    required this.child,
    this.maxWidth = 1100,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
  });

  final Widget child;
  final double maxWidth;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: Padding(padding: padding, child: child),
      ),
    );
  }
}