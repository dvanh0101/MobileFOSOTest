// lib/models/sub_category.dart
class SubCategory {
  final String id;
  final String title;
  final List<SubCategoryProduct> items;

  const SubCategory({
    required this.id,
    required this.title,
    this.items = const [],
  });
}

class SubCategoryProduct {
  final String id;
  final String name;
  final String imageUrl;

  const SubCategoryProduct({
    required this.id,
    required this.name,
    required this.imageUrl,
  });
}