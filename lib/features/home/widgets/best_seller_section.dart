import 'package:flutter/material.dart';
import '../../../models/product_item.dart';
import '../../../theme/app_colors.dart';
import '../../../shared/widgets/horizontal_product_list.dart';
import '../../../shared/widgets/section_header.dart';

class BestSellerSection extends StatelessWidget {
  final List<ProductItem> products;
  final VoidCallback? onSeeAll;
  final void Function(ProductItem product)? onProductTap;
  final void Function(ProductItem product)? onBuy;
  final String title;

  const BestSellerSection({
    super.key,
    required this.products,
    this.onSeeAll,
    this.onProductTap,
    this.onBuy,
    this.title = 'Sản Phẩm Bán Chạy',
  });

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: title,
          leading: const Icon(Icons.thumb_up_alt_rounded,
              size: 22, color: AppColors.primary),
          onSeeAll: onSeeAll,
        ),
        const SizedBox(height: 10),
        HorizontalProductList(
          products: products,
          height: 300, // có nhãn cam, không có thanh tiến độ
          onProductTap: onProductTap,
          onBuy: onBuy,
        ),
      ],
    );
  }
}