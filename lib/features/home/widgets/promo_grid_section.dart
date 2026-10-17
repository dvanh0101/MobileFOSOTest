import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';

class PromoItem {
  final String id;
  final String imageUrl;

  final String? fallbackTitle;
  final Color fallbackColor;

  const PromoItem({
    required this.id,
    required this.imageUrl,
    this.fallbackTitle,
    this.fallbackColor = AppColors.primary,
  });
}

class PromoGridSection extends StatelessWidget {
  final List<PromoItem> promos;
  final void Function(PromoItem promo)? onPromoTap;
  final double gap;

  final double smallAspectRatio;
  final EdgeInsetsGeometry padding;

  const PromoGridSection({
    super.key,
    required this.promos,
    this.onPromoTap,
    this.gap = 10,
    this.smallAspectRatio = 1.4,
    this.padding = const EdgeInsets.symmetric(horizontal: 12),
  });

  @override
  Widget build(BuildContext context) {
    if (promos.length < 3) return const SizedBox.shrink();

    return Padding(
      padding: padding,
      child: LayoutBuilder(builder: (context, c) {
        final colWidth = (c.maxWidth - gap) / 2;
        final smallHeight = colWidth / smallAspectRatio;
        final totalHeight = smallHeight * 2 + gap;

        return SizedBox(
          height: totalHeight,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Expanded(child: _PromoTile(item: promos[0], onTap: onPromoTap)),
                    SizedBox(height: gap),
                    Expanded(child: _PromoTile(item: promos[1], onTap: onPromoTap)),
                  ],
                ),
              ),
              SizedBox(width: gap),
              Expanded(child: _PromoTile(item: promos[2], onTap: onPromoTap)),
            ],
          ),
        );
      }),
    );
  }
}

class _PromoTile extends StatelessWidget {
  final PromoItem item;
  final void Function(PromoItem promo)? onTap;
  const _PromoTile({required this.item, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: GestureDetector(
        onTap: () => onTap?.call(item),
        child: SizedBox.expand(
          child: buildImage(item.imageUrl, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
