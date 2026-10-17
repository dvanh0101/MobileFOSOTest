import 'package:flutter/material.dart';
import '../../models/product_item.dart';
import 'product_card.dart';

class HorizontalProductList extends StatelessWidget {
  final List<ProductItem> products;
  final void Function(ProductItem product)? onProductTap;
  final void Function(ProductItem product)? onBuy;
  final Widget Function(BuildContext context, ProductItem product)? itemBuilder;
  final Widget? leading;

  final double height;
  final double itemWidth;
  final EdgeInsetsGeometry padding;
  final double spacing;

  const HorizontalProductList({
    super.key,
    required this.products,
    this.onProductTap,
    this.onBuy,
    this.itemBuilder,
    this.leading,
    this.height = 280,
    this.itemWidth = 148,
    this.padding = const EdgeInsets.symmetric(horizontal: 12),
    this.spacing = 12,
  });

  @override
  Widget build(BuildContext context) {
    final offset = leading == null ? 0 : 1;
    return Padding(
      padding: padding,
      child: SizedBox(
        height: height,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.zero,
          itemCount: products.length + offset,
          separatorBuilder: (_, __) => SizedBox(width: spacing),
          itemBuilder: (context, i) {
            if (leading != null && i == 0) return leading!;
            final p = products[i - offset];
            return itemBuilder?.call(context, p) ??
                ProductCard(
                  product: p,
                  width: itemWidth,
                  onTap: () => onProductTap?.call(p),
                  onBuy: () => onBuy?.call(p),
                );
          },
        ),
      ),
    );
  }
}
