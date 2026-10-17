import 'package:flutter/material.dart';
import '../../../models/category_item.dart';
import '../../../theme/app_colors.dart';
import 'sub_category_section.dart';

class CategoryContent extends StatelessWidget {
  final CategoryItem category;

  const CategoryContent({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  category.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              const Icon(Icons.chevron_right, size: 22, color: AppColors.textPrimary),
            ],
          ),
          const Divider(height: 24, thickness: 0.8, color: AppColors.divider),
          for (var i = 0; i < category.subCategories.length; i++) ...[
            if (i > 0) const Divider(height: 28, thickness: 0.8, color: AppColors.divider),
            SubCategorySection(subCategory: category.subCategories[i]),
          ],
        ],
      ),
    );
  }
}
