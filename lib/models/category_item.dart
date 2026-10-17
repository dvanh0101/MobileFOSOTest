import '../models/sub_category_item.dart';

class CategoryItem {
  final String id;
  final String name;
  final String imageUrl;
  final List<SubCategory> subCategories;

  const CategoryItem({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.subCategories = const [],
  });
}