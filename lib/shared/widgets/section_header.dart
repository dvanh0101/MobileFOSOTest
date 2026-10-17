import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final Widget? leading;
  final IconData? icon;
  final Widget? middle;
  final VoidCallback? onSeeAll;
  final String seeAllText;
  final Color? seeAllColor;
  final EdgeInsetsGeometry padding;
  final bool onDark;

  const SectionHeader({
    super.key,
    required this.title,
    this.leading,
    this.icon,
    this.middle,
    this.onSeeAll,
    this.seeAllText = 'Xem tất cả',
    this.seeAllColor,
    this.padding = const EdgeInsets.symmetric(horizontal: 12),
    this.onDark = false,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveLeading = leading ?? (icon != null ? Icon(icon, size: 22, color: onDark ? Colors.white : AppColors.primary) : null);
    final textColor = onDark ? Colors.white : AppColors.textPrimary;
    final actionColor = seeAllColor ?? (onDark ? Colors.white70 : AppColors.primary);

    return Padding(
      padding: padding,
      child: Row(
        children: [
          if (effectiveLeading != null) ...[effectiveLeading, const SizedBox(width: 8)],
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: textColor,
            ),
          ),
          if (middle != null) ...[const SizedBox(width: 12), middle!],
          const Spacer(),
          if (onSeeAll != null)
            InkWell(
              onTap: onSeeAll,
              borderRadius: BorderRadius.circular(6),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      seeAllText,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: actionColor,
                      ),
                    ),
                    Icon(
                      seeAllText.contains('»') ? Icons.keyboard_arrow_right : Icons.chevron_right,
                      size: 16,
                      color: actionColor,
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
