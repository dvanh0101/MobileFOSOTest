# 🚗 Ứng Dụng Mua Sắm Phụ Tùng Ô Tô (Flutter)

Ứng dụng di động thương mại điện tử chuyên cung cấp thiết bị lọc và phụ tùng ô tô cao cấp, được xây dựng bằng **Flutter** theo kiến trúc **Feature-First / Clean Architecture**, tối ưu hóa hiệu năng và giao diện Responsive thích ứng với mọi kích thước màn hình.

---
## 🛠️ Hướng Dẫn Chạy Ứng Dụng

### Yêu Cầu Môi Trường
* **Flutter SDK**: `>= 3.8.1`
* **Dart SDK**: `>= 3.0.0`
* IDE gợi ý: **Android Studio** hoặc **VS Code** có cài đặt Plugin Flutter & Dart.

### Các Bước Thực Hiện

1. **Chuyển đến thư mục dự án**:
   ```bash
   cd test_mobile_app_foso
   ```

2. **Tải các thư viện phụ thuộc (Dependencies)**:
   ```bash
   flutter pub get
   ```

3. **Kiểm tra thiết bị hoặc máy ảo đã kết nối**:
   ```bash
   flutter devices
   ```

4. **Khởi chạy ứng dụng**:
   ```bash
   flutter run
   ```

## 📱 Các Màn Hình & Tính Năng Nổi Bật

### 1. 🏠 Màn Hình Trang Chủ (`HomeScreen`)
* **AppBar Xanh Cao Cấp**: Tích hợp thanh tìm kiếm thông minh, icon máy ảnh và chuông thông báo với huy hiệu số lượng.
* **Banner Voucher Ưu Đãi**: Hiển thị hình ảnh mã giảm giá áp dụng cho khách hàng mới.
* **Danh Mục Tiêu Biểu**: Danh sách cuộn ngang kèm thanh chỉ báo vị trí cuộn (`ScrollIndicator`).
* **Banner Carousel Quảng Cáo**: Tự động chuyển trang mượt mà kèm các chấm chỉ báo vị trí.
* **Flash Sale Đếm Ngược**: Đồng hồ đếm ngược dạng thẻ thời gian, thanh tiến độ sản phẩm đã bán kèm biểu tượng ngọn lửa.
* **Lưới Thương Hiệu Nổi Bật**: Hiển thị 10 logo thương hiệu xe hơi phổ biến (Honda, Ford, BMW, Audi, Kia, Nissan,...).
* **Sản Phẩm Bán Chạy**: Thẻ sản phẩm gắn huy hiệu nhãn cam "Chỉ còn 1 sản phẩm".
* **Lưới Khuyến Mãi (Promo Grid)**: Bố cục 3 ô banner ấn tượng (Mua 1 tặng 1, Xả kho giá sốc, Đồng giá 299K).
* **Dành Cho Bạn**: Đi kèm thẻ banner giới thiệu Bộ lọc chất lượng cao.
* **Hàng Mới Về**: Nền xanh đậm nổi bật thu hút sự chú ý.
* **Bài Viết Nổi Bật**: Danh sách tin tức, bài viết kiến thức kỹ thuật.

### 2. 📂 Màn Hình Danh Mục (`CategoryScreen`)
* **AppBar**: Hỗ trợ nút quay lại (`<`), thanh tìm kiếm và chuông thông báo.
* **Sidebar Bên Trái**: Danh sách danh mục cuộn dọc, tự động làm nổi bật tab đang chọn với nền trắng và bo góc.
* **Vùng Nội Dung Bên Phải**: Hiển thị danh mục con (Sub Category) theo dạng lưới 3 cột sản phẩm với nút *"Xem tất cả »"*.

### 3. ⚓ Thanh Điều Hướng Dưới Cùng (`CustomBottomNavBar`)
* Thiết kế bo góc trên (`20dp`), bóng đổ nhẹ.
* Thanh chỉ báo màu xanh nằm ở mép trên của Tab đang chọn.
* Huy hiệu số thông báo màu đỏ hiển thị trên icon Tab Giỏ hàng.

---

## 📁 Cấu Trúc Thư Mục Source Code

```text
lib/
├── app.dart                    # Cấu hình MaterialApp & GoRouter
├── main.dart                   # Hàm khởi chạy ứng dụng (entry point)
├── core/
│   ├── router/
│   │   └── app_router.dart     # Cấu hình các tuyến đường chuyển màn hình (GoRouter)
│   └── utils/
│       └── responsive.dart     # Tiện ích Responsive thích ứng các kích thước màn hình
├── models/                     # Các Data Model dùng chung
│   ├── product_item.dart       # Model Sản phẩm & Bài viết
│   ├── category_item.dart      # Model Danh mục chính
│   └── sub_category_item.dart  # Model Danh mục con & Sản phẩm danh mục
├── theme/
│   └── app_colors.dart         # Định nghĩa bảng màu hệ thống & helper buildImage
├── shared/                     # Các Widget dùng chung toàn ứng dụng
│   └── widgets/
│       ├── appbar/             # CommonAppBar, AppSearchBar, NotificationBell
│       ├── product_card.dart   # Thẻ hiển thị sản phẩm
│       ├── article_tile.dart   # Dòng hiển thị bài viết
│       ├── horizontal_product_list.dart # Khung cuộn sản phẩm ngang
│       ├── section_header.dart # Tiêu đề từng khối + nút "Xem tất cả »"
│       └── countdown_timer.dart# Đồng hồ đếm ngược Flash Sale
└── features/                   # Module các tính năng chính (Feature-first)
    ├── main/                   # Khung chuyển Tab (MainShell & CustomBottomNavBar)
    ├── home/                   # Màn hình Trang chủ
    │   ├── data/               # HomeData & HomeRepository (Dữ liệu mẫu)
    │   ├── presentation/       # HomeScreen & HomeController
    │   └── widgets/            # Các section riêng của Home
    ├── category/               # Màn hình Danh mục
    │   ├── data/               # CategoryData & CategoryRepository
    │   ├── presentation/       # CategoryScreen & CategoryController
    │   └── widgets/            # Sidebar, SubCategorySection, Content...
    ├── cart/                   # Tab Giỏ hàng
    ├── news/                   # Tab Tin tức
    └── profile/                # Tab Tài khoản
```

---


