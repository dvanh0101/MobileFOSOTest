import 'package:flutter/material.dart';
import '../../../models/product_item.dart';
import '../../../theme/app_colors.dart';
import '../../../shared/widgets/countdown_timer.dart';
import '../../../shared/widgets/horizontal_product_list.dart';
import '../../../shared/widgets/section_header.dart';

class FlashSaleSection extends StatefulWidget {
  final List<ProductItem> products;
  final DateTime endTime;
  final VoidCallback? onSeeAll;
  final void Function(ProductItem product)? onProductTap;
  final void Function(ProductItem product)? onBuy;
  final VoidCallback? onFinished;

  const FlashSaleSection({
    super.key,
    required this.products,
    required this.endTime,
    this.onSeeAll,
    this.onProductTap,
    this.onBuy,
    this.onFinished,
  });

  @override
  State<FlashSaleSection> createState() => _FlashSaleSectionState();
}

class _FlashSaleSectionState extends State<FlashSaleSection> {
  bool _ended = false;

  @override
  void didUpdateWidget(covariant FlashSaleSection old) {
    super.didUpdateWidget(old);
    if (old.endTime != widget.endTime) _ended = false;
  }

  @override
  Widget build(BuildContext context) {
    final expired = _ended || !widget.endTime.isAfter(DateTime.now());
    if (widget.products.isEmpty || expired) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.only(top: 12, bottom: 14),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFFFEBD6), Colors.white],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            title: 'FLASH SALE',
            leading: const Icon(Icons.bolt_rounded,
                size: 26, color: AppColors.warning),
            middle: CountdownTimer(
              endTime: widget.endTime,
              onFinished: () {
                if (!mounted) return;
                setState(() => _ended = true);
                widget.onFinished?.call();
              },
            ),
            onSeeAll: widget.onSeeAll ?? () {},
            seeAllColor: AppColors.price,
          ),
          const SizedBox(height: 10),
          HorizontalProductList(
            products: widget.products,
            height: 335, // thẻ Flash Sale cao hơn vì có thanh tiến độ
            onProductTap: widget.onProductTap,
            onBuy: widget.onBuy,
          ),
        ],
      ),
    );
  }
}
