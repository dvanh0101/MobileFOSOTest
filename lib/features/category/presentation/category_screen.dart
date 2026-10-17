import 'package:flutter/material.dart';
import '../../../shared/widgets/appbar/common_app_bar.dart';
import '../../../theme/app_colors.dart';
import '../widgets/category_content.dart';
import '../widgets/category_sidebar.dart';
import 'category_controller.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late final CategoryController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CategoryController()..load();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBarBlue,
      appBar: const CommonAppBar(
        showBack: true,
        // notificationCount: 12,
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        clipBehavior: Clip.antiAlias,
        child: ListenableBuilder(
          listenable: _controller,
          builder: (context, _) => _buildBody(),
        ),
      ),
    );
  }

  Widget _buildBody() {
    if (_controller.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_controller.error != null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(_controller.error!),
            const SizedBox(height: 8),
            TextButton(
              onPressed: _controller.load,
              child: const Text('Thử lại'),
            ),
          ],
        ),
      );
    }

    final selected = _controller.selectedCategory;
    if (selected == null) {
      return const Center(child: Text('Chưa có danh mục'));
    }

    return Row(
      children: [
        CategorySidebar(
          categories: _controller.categories,
          selectedIndex: _controller.selectedIndex,
          onSelected: _controller.select,
        ),
        Expanded(
          child: CategoryContent(
            key: ValueKey(selected.id),
            category: selected,
          ),
        ),
      ],
    );
  }
}
