import 'package:flutter/material.dart';

import '../../../models/product_item.dart';
import '../../../shared/widgets/horizontal_product_list.dart';
import '../../../shared/widgets/section_header.dart';

class NewArrivalsSection extends StatelessWidget {
  const NewArrivalsSection({
    super.key,
    required this.products,
    this.onSeeAll,
    this.onProductTap,
    this.onBuy,
  });

  final List<ProductItem> products;
  final VoidCallback? onSeeAll;
  final ValueChanged<ProductItem>? onProductTap;
  final ValueChanged<ProductItem>? onBuy;

  static const _background = Color(0xFF0D47D9);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _background,
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            title: 'Hàng Mới Về',
            icon: Icons.inventory_2_rounded,
            onSeeAll: onSeeAll,
            onDark: true,
          ),
          const SizedBox(height: 12),
          HorizontalProductList(
            products: products,
            onProductTap: onProductTap,
            onBuy: onBuy,
          ),
        ],
      ),
    );
  }
}
