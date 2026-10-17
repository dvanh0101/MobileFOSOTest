import 'package:flutter/material.dart';
import '../../../shared/widgets/app_network_image.dart';
import '../../../shared/widgets/section_header.dart';
import '../../../theme/app_colors.dart';

class BrandItem {
  final String id;
  final String name;
  final String logoUrl;
  const BrandItem(
      {required this.id, required this.name, required this.logoUrl});
}

class BrandSection extends StatelessWidget {
  final List<BrandItem> brands;
  final void Function(BrandItem brand)? onBrandTap;
  final VoidCallback? onSeeAll;
  final String title;
  final int columns;
  final int maxItems;

  const BrandSection({
    super.key,
    required this.brands,
    this.onBrandTap,
    this.onSeeAll,
    this.title = 'Thương Hiệu Nổi Bật',
    this.columns = 5,
    this.maxItems = 10,
  });

  @override
  Widget build(BuildContext context) {
    if (brands.isEmpty) return const SizedBox.shrink();
    final items = brands.take(maxItems).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: title,
          leading: const Icon(Icons.verified_rounded,
              size: 22, color: AppColors.primary),
          onSeeAll: onSeeAll,
        ),
        const SizedBox(height: 10),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          itemCount: items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 1,
          ),
          itemBuilder: (_, i) => _BrandTile(
            brand: items[i],
            onTap: () => onBrandTap?.call(items[i]),
          ),
        ),
      ],
    );
  }
}

class _BrandTile extends StatelessWidget {
  final BrandItem brand;
  final VoidCallback? onTap;
  const _BrandTile({required this.brand, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xFFEDEEF2)),
          ),
          child: AppNetworkImage(url: brand.logoUrl, fit: BoxFit.contain),
        ),
      ),
    );
  }
}
