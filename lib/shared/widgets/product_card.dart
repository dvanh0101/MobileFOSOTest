import 'package:flutter/material.dart';
import '../../models/product_item.dart';
import '../../theme/app_colors.dart';

class ProductCard extends StatelessWidget {
  final ProductItem product;
  final double width;
  final VoidCallback? onTap;
  final VoidCallback? onBuy;

  const ProductCard({
    super.key,
    required this.product,
    this.width = 148,
    this.onTap,
    this.onBuy,
  });

  @override
  Widget build(BuildContext context) {
    final p = product;
    final discount = p.discountPercent;

    return SizedBox(
      width: width,
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFEDEEF2)),
            ),
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: ColoredBox(
                      color: AppColors.imageBg,
                      child: buildImage(p.imageUrl, fit: BoxFit.cover),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                if (p.badge != null) ...[
                  _Badge(text: p.badge!),
                  const SizedBox(height: 6),
                ],
                Text(
                  p.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    height: 1.25,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  formatVnd(p.price),
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: AppColors.price,
                  ),
                ),
                if (p.oldPrice != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Row(
                      children: [
                        Flexible(
                          child: Text(
                            formatVnd(p.oldPrice!),
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 11,
                              color: AppColors.textSecondary,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ),
                        if (discount != null) ...[
                          const SizedBox(width: 6),
                          Text('-$discount%',
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: AppColors.price,
                              )),
                        ],
                      ],
                    ),
                  ),
                if (p.soldProgress != null) ...[
                  const SizedBox(height: 8),
                  _SoldBar(progress: p.soldProgress!),
                  const SizedBox(height: 4),
                  Text(
                    'Đã bán ${p.soldCount ?? 0} sản phẩm',
                    style: const TextStyle(
                        fontSize: 11, color: AppColors.textSecondary),
                  ),
                ],
                const Spacer(),
                const SizedBox(height: 6),
                SizedBox(
                  width: double.infinity,
                  height: 32,
                  child: TextButton(
                    onPressed: onBuy,
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.primaryLight,
                      foregroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      padding: EdgeInsets.zero,
                    ),
                    child: const Text('Mua ngay',
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w700)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final String text;
  const _Badge({required this.text});

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
    decoration: BoxDecoration(
      color: AppColors.warningLight,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.local_fire_department,
            size: 11, color: AppColors.warning),
        const SizedBox(width: 3),
        Flexible(
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: AppColors.warning),
          ),
        ),
      ],
    ),
  );
}

class _SoldBar extends StatelessWidget {
  final double progress;
  const _SoldBar({required this.progress});

  @override
  Widget build(BuildContext context) {
    final v = progress.clamp(0.0, 1.0);
    return SizedBox(
      height: 14,
      child: LayoutBuilder(builder: (context, c) {
        final fill = c.maxWidth * v;
        return Stack(
          alignment: Alignment.centerLeft,
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 8,
              decoration: BoxDecoration(
                color: AppColors.warningLight,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            Container(
              height: 8,
              width: fill,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                    colors: [Color(0xFFFF6A00), Color(0xFFFFB347)]),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            Positioned(
              left: (fill - 7).clamp(0.0, c.maxWidth - 14),
              child: const Icon(Icons.local_fire_department,
                  size: 14, color: AppColors.warning),
            ),
          ],
        );
      }),
    );
  }
}
