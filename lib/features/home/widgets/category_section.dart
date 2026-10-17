import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show ValueListenable;
import '../../../theme/app_colors.dart';

class CategoryItem {
  final String id;
  final String name;
  final String imageUrl;
  const CategoryItem(
      {required this.id, required this.name, required this.imageUrl});
}

class CategorySection extends StatefulWidget {
  final List<CategoryItem> categories;
  final void Function(CategoryItem category)? onCategoryTap;
  final String title;

  const CategorySection({
    super.key,
    required this.categories,
    this.onCategoryTap,
    this.title = 'Danh mục tiêu biểu',
  });

  @override
  State<CategorySection> createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection> {
  final _controller = ScrollController();
  final _progress = ValueNotifier<double>(0);

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onScroll);
  }

  void _onScroll() {
    if (!_controller.hasClients) return;
    final max = _controller.position.maxScrollExtent;
    _progress.value = max <= 0 ? 0 : (_controller.offset / max).clamp(0.0, 1.0);
  }

  @override
  void dispose() {
    _controller.removeListener(_onScroll);
    _controller.dispose();
    _progress.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            widget.title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 104,
          child: ListView.separated(
            controller: _controller,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemCount: widget.categories.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (_, i) {
              final c = widget.categories[i];
              return _CategoryTile(
                item: c,
                onTap: () => widget.onCategoryTap?.call(c),
              );
            },
    // Padding(
    // padding: const EdgeInsets.symmetric(horizontal: 12),
    // child: SizedBox(
    // height: 104,
    // child: ListView.separated(
    // controller: _controller,
    // scrollDirection: Axis.horizontal,
    // padding: EdgeInsets.zero,
    // itemCount: widget.categories.length,
    // separatorBuilder: (_, __) => const SizedBox(width: 12),
    // itemBuilder: (_, i) {
    // final c = widget.categories[i];
    // return _CategoryTile(
    // item: c,
    // onTap: () => widget.onCategoryTap?.call(c),
    // );
    // },
    // ),
          ),
        ),
        const SizedBox(height: 10),
        Center(child: _ScrollIndicator(progress: _progress)),
      ],
    );
  }
}

class _CategoryTile extends StatelessWidget {
  final CategoryItem item;
  final VoidCallback? onTap;
  const _CategoryTile({required this.item, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 80,
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFEDEEF2)),
          ),
          child: Column(
            children: [
              Expanded(
                child: buildImage(item.imageUrl, fit: BoxFit.contain),
              ),
              const SizedBox(height: 6),
              Text(
                item.name,
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 11,
                  height: 1.2,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Thanh trượt nhỏ: nền xám, thanh xanh di chuyển theo tiến độ cuộn.
class _ScrollIndicator extends StatelessWidget {
  final ValueListenable<double> progress;
  const _ScrollIndicator({required this.progress});

  static const _trackWidth = 56.0;
  static const _thumbWidth = 24.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _trackWidth,
      height: 4,
      child: ValueListenableBuilder<double>(
        valueListenable: progress,
        builder: (_, v, __) => Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFE3E6EC),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Positioned(
              left: (_trackWidth - _thumbWidth) * v,
              child: Container(
                width: _thumbWidth,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
