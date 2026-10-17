import 'package:flutter/material.dart';
import '../../../models/category_item.dart';
import 'category_sidebar_item.dart';
import '../../../theme/app_colors.dart';

class CategorySidebar extends StatelessWidget {
  final List<CategoryItem> categories;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  const CategorySidebar({
    super.key,
    required this.categories,
    required this.selectedIndex,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      color: AppColors.categorySb,
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 8, bottom: 24),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final item = categories[index];
          return CategorySidebarItem(
            name: item.name,
            imageUrl: item.imageUrl,
            isSelected: index == selectedIndex,
            onTap: () => onSelected(index),
          );
        },
      ),
    );
  }
}
