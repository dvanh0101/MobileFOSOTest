/// Định dạng tiền VNĐ: 299000 -> "299,000 đ" (không cần package intl).
String formatVnd(num value) {
  final s = value.round().toString();
  final buf = StringBuffer();
  for (var i = 0; i < s.length; i++) {
    if (i > 0 && (s.length - i) % 3 == 0) buf.write(',');
    buf.write(s[i]);
  }
  return '$buf đ';
}

class ProductItem {
  final String id;
  final String name;
  final String imageUrl;
  final num price;
  final num? oldPrice;

  /// Nhãn nhỏ phía trên tên, ví dụ "Chỉ còn 1 sản phẩm".
  final String? badge;

  /// Dành cho Flash Sale: số đã bán và tiến độ 0..1.
  final int? soldCount;
  final double? soldProgress;

  const ProductItem({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    this.oldPrice,
    this.badge,
    this.soldCount,
    this.soldProgress,
  });

  int? get discountPercent {
    if (oldPrice == null || oldPrice! <= price) return null;
    return (((oldPrice! - price) / oldPrice!) * 100).round();
  }
}

class ArticleItem {
  final String id;
  final String title;
  final String imageUrl;
  final String dateText; // ví dụ "13/02/2025"

  const ArticleItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.dateText,
  });
}