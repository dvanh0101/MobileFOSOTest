import 'package:flutter/foundation.dart';
import '../../../models/category_item.dart';
import '../data/category_repository.dart';

class CategoryController extends ChangeNotifier {
  final CategoryRepository _repository;

  CategoryController({CategoryRepository? repository})
      : _repository = repository ?? CategoryRepository();

  List<CategoryItem> _categories = [];
  int _selectedIndex = 0;
  bool _isLoading = false;
  String? _error;

  List<CategoryItem> get categories => _categories;
  int get selectedIndex => _selectedIndex;
  bool get isLoading => _isLoading;
  String? get error => _error;

  CategoryItem? get selectedCategory =>
      _categories.isEmpty ? null : _categories[_selectedIndex];

  Future<void> load() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _categories = await _repository.getCategories();
      _selectedIndex = 0;
    } catch (e) {
      _error = 'Không thể tải danh mục';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void select(int index) {
    if (index == _selectedIndex || index < 0 || index >= _categories.length) {
      return;
    }
    _selectedIndex = index;
    notifyListeners();
  }
}