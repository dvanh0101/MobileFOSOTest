import '../../../models/category_item.dart';
import 'category_data.dart';

class CategoryRepository {
  Future<List<CategoryItem>> getCategories() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return categoryMockData;
  }
}