import 'package:flutter/material.dart';
import '../../../models/sub_category_item.dart';
import '../../../theme/app_colors.dart';
import 'sub_category_item.dart';

class SubCategorySection extends StatelessWidget {
  final SubCategory subCategory;
  final VoidCallback? onSeeAll;
  final ValueChanged<SubCategoryProduct>? onItemTap;

  const SubCategorySection({
    super.key,
    required this.subCategory,
    this.onSeeAll,
    this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                subCategory.title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
            InkWell(
              onTap: onSeeAll ?? () {},
              borderRadius: BorderRadius.circular(4),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Xem tất cả',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                  SizedBox(width: 2),
                  Icon(Icons.keyboard_arrow_right,
                      size: 16, color: AppColors.primary),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: subCategory.items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 12,
            crossAxisSpacing: 10,
            childAspectRatio: 0.78,
          ),
          itemBuilder: (context, index) {
            final product = subCategory.items[index];
            return SubCategoryItemWidget(
              name: product.name,
              imageUrl: product.imageUrl,
              onTap: () => onItemTap?.call(product),
            );
          },
        ),
      ],
    );
  }
}
