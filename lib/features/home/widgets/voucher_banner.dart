import 'package:flutter/material.dart';

class VoucherBanner extends StatelessWidget {
  final EdgeInsetsGeometry margin;

  const VoucherBanner({
    super.key,
    this.margin = const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          'assets/images/voucherbanner.png',
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
