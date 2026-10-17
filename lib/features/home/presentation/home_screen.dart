import 'package:flutter/material.dart';

import '../../../shared/widgets/appbar/common_app_bar.dart';
import '../widgets/banner_carousel.dart';
import '../widgets/best_seller_section.dart';
import '../widgets/brand_section.dart';
import '../widgets/category_section.dart';
import '../widgets/featured_articles_section.dart';
import '../widgets/flash_sale_section.dart';
import '../widgets/for_you_section.dart';
import '../widgets/new_arrivals_section.dart';
import '../widgets/promo_grid_section.dart';
import '../widgets/voucher_banner.dart';
import '../../../theme/app_colors.dart';
import 'home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.controller});

  final HomeController? controller;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeController _c;
  late final bool _ownsController;

  @override
  void initState() {
    super.initState();
    _ownsController = widget.controller == null;
    _c = widget.controller ?? HomeController();
    _c.load();
  }

  @override
  void dispose() {
    if (_ownsController) _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _c,
      builder: (context, _) {
        return Scaffold(
          backgroundColor: AppColors.appBarBlue,
          appBar: CommonAppBar(
            onSearchSubmitted: (keyword) {
              // TODO: điều hướng sang màn kết quả tìm kiếm
            },
            onCameraTap: () {
              // TODO: mở camera / tìm bằng hình ảnh
            },
            onBellTap: () {
              // TODO: mở màn thông báo
            },
            notificationCount: 0,
          ),
          body: Container(
            decoration: const BoxDecoration(
              color: AppColors.sheetColor,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            clipBehavior: Clip.antiAlias,
            child: _buildBody(),
          ),
        );
      },
    );
  }

  Widget _buildBody() {
    switch (_c.status) {
      case HomeStatus.loading:
        return const Center(child: CircularProgressIndicator());
      case HomeStatus.error:
        return _ErrorView(onRetry: _c.load);
      case HomeStatus.success:
        return RefreshIndicator(
          onRefresh: _c.refresh,
          child: _buildContent(),
        );
    }
  }

  Widget _buildContent() {
    final d = _c.data!;
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 0),
      children: [
        VoucherBanner(),
        CategorySection(categories: d.categories),
        BannerCarousel(banners: d.banners),
        FlashSaleSection(
          endTime: d.flashSale.endTime,
          products: d.flashSale.products,
          onSeeAll: () {},
        ),
        BrandSection(
          brands: d.brands,
        ),
        BestSellerSection(
          products: d.bestSellers,
          onSeeAll: () {},
        ),
        PromoGridSection(promos: d.promos),
        ForYouSection(
          products: d.forYou,
          onSeeAll: () {},
        ),
        NewArrivalsSection(
          products: d.newArrivals,
          onSeeAll: () {},
        ),
        FeaturedArticlesSection(
          articles: d.articles,
          onSeeAll: () {},
        ),
      ].map(_withSpacing).toList(),
    );
  }

  Widget _withSpacing(Widget w) => w is NewArrivalsSection
      ? w
      : Padding(padding: const EdgeInsets.only(top: 12), child: w);
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.onRetry});
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Không tải được dữ liệu'),
          const SizedBox(height: 12),
          FilledButton(onPressed: onRetry, child: const Text('Thử lại')),
        ],
      ),
    );
  }
}
