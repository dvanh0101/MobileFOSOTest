import '../../../models/product_item.dart';
import '../widgets/banner_carousel.dart';
import '../widgets/brand_section.dart';
import '../widgets/category_section.dart';
import '../widgets/promo_grid_section.dart';

class FlashSaleData {
  final DateTime endTime;
  final List<ProductItem> products;
  const FlashSaleData({required this.endTime, required this.products});
}

class HomeData {
  final List<CategoryItem> categories;
  final List<BannerItem> banners;
  final FlashSaleData flashSale;
  final List<BrandItem> brands;
  final List<ProductItem> bestSellers;
  final List<PromoItem> promos;
  final List<ProductItem> forYou;
  final List<ProductItem> newArrivals;
  final List<ArticleItem> articles;
  final int notificationCount;

  const HomeData({
    required this.categories,
    required this.banners,
    required this.flashSale,
    required this.brands,
    required this.bestSellers,
    required this.promos,
    required this.forYou,
    required this.newArrivals,
    required this.articles,
    this.notificationCount = 12,
  });
}
