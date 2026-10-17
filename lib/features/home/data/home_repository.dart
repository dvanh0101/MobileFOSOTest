import '../../../models/product_item.dart';
import '../widgets/banner_carousel.dart';
import '../widgets/brand_section.dart';
import '../widgets/category_section.dart';
import '../widgets/promo_grid_section.dart';
import 'home_data.dart';

class HomeRepository {
  Future<HomeData> fetchHome() async {
    await Future.delayed(const Duration(milliseconds: 200));

    return HomeData(
      notificationCount: 12,
      categories: const [
        CategoryItem(
          id: 'c1',
          name: 'Bộ Lọc Không Khí',
          imageUrl: 'assets/images/img.png',
        ),
        CategoryItem(
          id: 'c2',
          name: 'Bộ Lọc Dầu',
          imageUrl: 'assets/images/img1.png',
        ),
        CategoryItem(
          id: 'c3',
          name: 'Bộ Lọc Nhiên Liệu',
          imageUrl: 'assets/images/img2.png',
        ),
        CategoryItem(
          id: 'c4',
          name: 'Bộ Lọc Trong Cabin',
          imageUrl: 'assets/images/img3.png',
        ),
        CategoryItem(
          id: 'c5',
          name: 'Bộ Lọc Khác',
          imageUrl: 'assets/images/img4.png',
        ),
        CategoryItem(
          id: 'c6',
          name: 'Bộ Lọc Nhiên Liệu',
          imageUrl: 'assets/images/img2.png',
        ),
        CategoryItem(
          id: 'c7',
          name: 'Bộ Lọc Dầu',
          imageUrl: 'assets/images/img1.png',
        ),
      ],
      banners: const [
        BannerItem(
          id: 'b1',
          imageUrl: 'assets/images/highlight.png',
        ),
        BannerItem(
          id: 'b2',
          imageUrl: 'assets/images/imageUrl.png',
        ),
        BannerItem(
          id: 'b3',
          imageUrl: 'assets/images/highlight1.png',
        ),
      ],
      flashSale: FlashSaleData(
        endTime: DateTime.now().add(const Duration(hours: 19, minutes: 25)),
        products: const [
          ProductItem(
            id: 'fs1',
            name: 'Lọc gió động cơ Air Filter - Chevrolet Cruze...',
            imageUrl: 'assets/images/img5.png',
            price: 299000,
            oldPrice: 329000,
            soldCount: 88,
            soldProgress: 0.75,
          ),
          ProductItem(
            id: 'fs2',
            name: 'Lọc gió động cơ Air Filter - Chevrolet Cruze...',
            imageUrl: 'assets/images/img5.png',
            price: 299000,
            oldPrice: 329000,
            soldCount: 88,
            soldProgress: 0.75,
          ),
          ProductItem(
            id: 'fs3',
            name: 'Lọc gió động cơ Air Filter - Chevrolet Cruze...',
            imageUrl: 'assets/images/img5.png',
            price: 299000,
            oldPrice: 329000,
            soldCount: 88,
            soldProgress: 0.75,
          ),
          ProductItem(
            id: 'fs4',
            name: 'Lọc gió động cơ Air Filter - Chevrolet Cruze...',
            imageUrl: 'assets/images/img5.png',
            price: 299000,
            oldPrice: 329000,
            soldCount: 88,
            soldProgress: 0.75,
          ),
          ProductItem(
            id: 'fs5',
            name: 'Lọc gió động cơ Air Filter - Chevrolet Cruze...',
            imageUrl: 'assets/images/img5.png',
            price: 299000,
            oldPrice: 329000,
            soldCount: 88,
            soldProgress: 0.75,
          ),
        ],
      ),
      brands: const [
        BrandItem(id: 'br1', name: 'Honda', logoUrl: 'assets/images/Honda.png'),
        BrandItem(id: 'br2', name: 'Ford', logoUrl: 'assets/images/Ford.png'),
        BrandItem(id: 'br3', name: 'BMW', logoUrl: 'assets/images/BMW.png'),
        BrandItem(id: 'br4', name: 'Audi', logoUrl: 'assets/images/Audi.png'),
        BrandItem(id: 'br5', name: 'Kia', logoUrl: 'assets/images/Kia.png'),
        BrandItem(id: 'br6', name: 'Nissan', logoUrl: 'assets/images/Nissan.png'),
        BrandItem(id: 'br7', name: 'Chevrolet', logoUrl: 'assets/images/Chevrolet.png'),
        BrandItem(id: 'br8', name: 'Volkswagen', logoUrl: 'assets/images/Volkswagen.png'),
        BrandItem(id: 'br9', name: 'Lexus', logoUrl: 'assets/images/Lexus.png'),
        BrandItem(id: 'br10', name: 'Volvo', logoUrl: 'assets/images/Volvo.png'),
      ],
      bestSellers: const [
        ProductItem(
          id: 'bs1',
          name: 'Lọc gió động cơ Air Filter - Chevrolet Cruze...',
          imageUrl: 'assets/images/img5.png',
          price: 299000,
          oldPrice: 329000,
          badge: 'Chỉ còn 1 sản phẩm',
        ),
        ProductItem(
          id: 'bs2',
          name: 'Lọc gió động cơ Air Filter - Chevrolet Cruze...',
          imageUrl: 'assets/images/img5.png',
          price: 299000,
          oldPrice: 329000,
          badge: 'Chỉ còn 1 sản phẩm',
        ),
        ProductItem(
          id: 'bs3',
          name: 'Lọc gió động cơ Air Filter - Chevrolet Cruze...',
          imageUrl: 'assets/images/img5.png',
          price: 299000,
          oldPrice: 329000,
          badge: 'Chỉ còn 1 sản phẩm',
        ),
        ProductItem(
          id: 'bs4',
          name: 'Lọc gió động cơ Air Filter - Chevrolet Cruze...',
          imageUrl: 'assets/images/img5.png',
          price: 299000,
          oldPrice: 329000,
          badge: 'Chỉ còn 1 sản phẩm',
        ),
        ProductItem(
          id: 'bs5',
          name: 'Lọc gió động cơ Air Filter - Chevrolet Cruze...',
          imageUrl: 'assets/images/img5.png',
          price: 299000,
          oldPrice: 329000,
          badge: 'Chỉ còn 1 sản phẩm',
        ),
      ],
      promos: const [
        PromoItem(
          id: 'p1',
          imageUrl: 'assets/images/highlight.png',
          fallbackTitle: 'MUA 1 TẶNG 1',
        ),
        PromoItem(
          id: 'p2',
          imageUrl: 'assets/images/highlight1.png',
          fallbackTitle: 'XẢ KHO GIÁ SỐC',
        ),
        PromoItem(
          id: 'p3',
          imageUrl: 'assets/images/highlight2.png',
          fallbackTitle: 'ĐỒNG GIÁ 299K',
        ),
      ],
      forYou: const [
        ProductItem(
          id: 'fy1',
          name: 'Lọc gió động cơ Air Filter - Chevrolet Cruze...',
          imageUrl: 'assets/images/img5.png',
          price: 299000,
          oldPrice: 329000,
        ),
        ProductItem(
          id: 'fy2',
          name: 'Lọc gió động cơ Air Filter - Chevrolet Cruze...',
          imageUrl: 'assets/images/img5.png',
          price: 299000,
          oldPrice: 329000,
        ),
        ProductItem(
          id: 'fy3',
          name: 'Lọc gió động cơ Air Filter - Chevrolet Cruze...',
          imageUrl: 'assets/images/img5.png',
          price: 299000,
          oldPrice: 329000,
        ),
        ProductItem(
          id: 'fy4',
          name: 'Lọc gió động cơ Air Filter - Chevrolet Cruze...',
          imageUrl: 'assets/images/img5.png',
          price: 299000,
          oldPrice: 329000,
        ),
        ProductItem(
          id: 'fy5',
          name: 'Lọc gió động cơ Air Filter - Chevrolet Cruze...',
          imageUrl: 'assets/images/img5.png',
          price: 299000,
          oldPrice: 329000,
        ),
      ],
      newArrivals: const [
        ProductItem(
          id: 'na1',
          name: 'Lọc gió động cơ Air Filter - Chevrolet Cruze...',
          imageUrl: 'assets/images/img5.png',
          price: 299000,
          oldPrice: 329000,
        ),
        ProductItem(
          id: 'na2',
          name: 'Lọc gió động cơ Air Filter - Chevrolet Cruze...',
          imageUrl: 'assets/images/img5.png',
          price: 299000,
          oldPrice: 329000,
        ),
        ProductItem(
          id: 'na3',
          name: 'Lọc gió động cơ Air Filter - Chevrolet Cruze...',
          imageUrl: 'assets/images/img5.png',
          price: 299000,
          oldPrice: 329000,
        ),
        ProductItem(
          id: 'na4',
          name: 'Lọc gió động cơ Air Filter - Chevrolet Cruze...',
          imageUrl: 'assets/images/img5.png',
          price: 299000,
          oldPrice: 329000,
        ),
        ProductItem(
          id: 'na5',
          name: 'Lọc gió động cơ Air Filter - Chevrolet Cruze...',
          imageUrl: 'assets/images/img5.png',
          price: 299000,
          oldPrice: 329000,
        ),
      ],
      articles: const [
        ArticleItem(
          id: 'a1',
          title: 'Đầu phun sprinkler là gì? Cấu tạo, ứng dụng và nguy...',
          imageUrl: 'assets/images/img8.jpg',
          dateText: '13/02/2025',
        ),
        ArticleItem(
          id: 'a2',
          title: 'Đầu phun sprinkler là gì? Cấu tạo, ứng dụng và nguy...',
          imageUrl: 'assets/images/img6.jpg',
          dateText: '13/02/2025',
        ),
        ArticleItem(
          id: 'a3',
          title: 'Đầu phun sprinkler là gì? Cấu tạo, ứng dụng và nguy...',
          imageUrl: 'assets/images/img7.jpg',
          dateText: '13/02/2025',
        ),
      ],
    );
  }
}
