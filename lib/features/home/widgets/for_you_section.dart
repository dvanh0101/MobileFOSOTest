import 'package:flutter/material.dart';

import '../../../models/product_item.dart';
import '../../../shared/widgets/horizontal_product_list.dart';
import '../../../shared/widgets/section_header.dart';

class ForYouSection extends StatelessWidget {
  const ForYouSection({
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            title: 'Dành Cho Bạn',
            icon: Icons.star_rounded,
            onSeeAll: onSeeAll,
          ),
          const SizedBox(height: 12),
          HorizontalProductList(
            height: 280,
            products: products,
            leading: const _FeaturedCard(),
            onProductTap: onProductTap,
            onBuy: onBuy,
          ),
        ],
      ),
    );
  }
}

class _FeaturedCard extends StatelessWidget {
  const _FeaturedCard();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 135,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          'assets/images/adsbanner.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
