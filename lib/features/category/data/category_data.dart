import '../../../models/category_item.dart';
import '../../../models/sub_category_item.dart';

final List<CategoryItem> categoryMockData = [
  CategoryItem(
    id: 'oil',
    name: 'Bộ Lọc Dầu',
    imageUrl: 'assets/images/img1.png',
    subCategories: [
      SubCategory(
        id: 'oil-sub-1',
        title: 'Sub Category 1',
        items: const [
          SubCategoryProduct(id: 'op1', name: 'Bộ lọc dầu cao cấp', imageUrl: 'assets/images/img2.png'),
          SubCategoryProduct(id: 'op2', name: 'Bộ lọc cabin', imageUrl: 'assets/images/img4.png'),
          SubCategoryProduct(id: 'op3', name: 'Bộ lọc nhiên liệu', imageUrl: 'assets/images/img3.png'),
        ],
      ),
    ],
  ),
  CategoryItem(
    id: 'air',
    name: 'Bộ Lọc Không Khí',
    imageUrl: 'assets/images/img.png',
    subCategories: [
      SubCategory(
        id: 'air-sub-1',
        title: 'Sub Category 1',
        items: const [
          SubCategoryProduct(id: 'p1', name: 'Bộ lọc gió', imageUrl: 'assets/images/img9.png'),
          SubCategoryProduct(id: 'p2', name: 'Bộ lọc trong cabin', imageUrl: 'assets/images/img10.png'),
          SubCategoryProduct(id: 'p3', name: 'Bộ lọc nhiên liệu', imageUrl: 'assets/images/img11.png'),
          SubCategoryProduct(id: 'p4', name: 'Bộ lọc gió', imageUrl: 'assets/images/img12.png'),
          SubCategoryProduct(id: 'p5', name: 'Bộ lọc gió', imageUrl: 'assets/images/img15.png'),
          SubCategoryProduct(id: 'p6', name: 'Bộ lọc gió', imageUrl: 'assets/images/img16.png'),
          SubCategoryProduct(id: 'p7', name: 'Bộ lọc gió', imageUrl: 'assets/images/img17.png'),
          SubCategoryProduct(id: 'p8', name: 'Bộ lọc gió', imageUrl: 'assets/images/img18.png'),
          SubCategoryProduct(id: 'p9', name: 'Bộ lọc gió', imageUrl: 'assets/images/img.png'),
        ],
      ),
      SubCategory(
        id: 'air-sub-2',
        title: 'Sub Category 2',
        items: const [
          SubCategoryProduct(id: 'p10', name: 'Bộ lọc gió', imageUrl: 'assets/images/img9.png'),
          SubCategoryProduct(id: 'p11', name: 'Bộ lọc trong cabin', imageUrl: 'assets/images/img10.png'),
          SubCategoryProduct(id: 'p12', name: 'Bộ lọc nhiên liệu', imageUrl: 'assets/images/img11.png'),
          SubCategoryProduct(id: 'p13', name: 'Bộ lọc gió', imageUrl: 'assets/images/img12.png'),
          SubCategoryProduct(id: 'p14', name: 'Bộ lọc gió', imageUrl: 'assets/images/img15.png'),
          SubCategoryProduct(id: 'p15', name: 'Bộ lọc gió', imageUrl: 'assets/images/img16.png'),
          SubCategoryProduct(id: 'p16', name: 'Bộ lọc gió', imageUrl: 'assets/images/img17.png'),
          SubCategoryProduct(id: 'p17', name: 'Bộ lọc gió', imageUrl: 'assets/images/img18.png'),
          SubCategoryProduct(id: 'p18', name: 'Bộ lọc gió', imageUrl: 'assets/images/img.png'),
        ],
      ),
    ],
  ),

  CategoryItem(
    id: 'fuel',
    name: 'Bộ Lọc Nhiên Liệu',
    imageUrl: 'assets/images/img2.png',
    subCategories: [
      SubCategory(
        id: 'fuel-sub-1',
        title: 'Sub Category 1',
        items: const [
          SubCategoryProduct(id: 'fp1', name: 'Bộ lọc nhiên liệu', imageUrl: 'assets/images/img3.png'),
          SubCategoryProduct(id: 'fp2', name: 'Bộ lọc gió', imageUrl: 'assets/images/img1.png'),
        ],
      ),
    ],
  ),
  CategoryItem(
    id: 'oil2',
    name: 'Bộ Lọc Dầu',
    imageUrl: 'assets/images/img2.png',
    subCategories: [],
  ),
  CategoryItem(
    id: 'oil3',
    name: 'Bộ Lọc Dầu',
    imageUrl: 'assets/images/img2.png',
    subCategories: [],
  ),
  CategoryItem(
    id: 'oil4',
    name: 'Bộ Lọc Dầu',
    imageUrl: 'assets/images/img2.png',
    subCategories: [],
  ),
  CategoryItem(
    id: 'oil5',
    name: 'Bộ Lọc Dầu',
    imageUrl: 'assets/images/img2.png',
    subCategories: [],
  ),
  CategoryItem(
    id: 'oil6',
    name: 'Bộ Lọc Dầu',
    imageUrl: 'assets/images/img2.png',
    subCategories: [],
  ),
  CategoryItem(
    id: 'oil7',
    name: 'Bộ Lọc Dầu',
    imageUrl: 'assets/images/img2.png',
    subCategories: [],
  ),
  CategoryItem(
    id: 'oil8',
    name: 'Bộ Lọc Dầu',
    imageUrl: 'assets/images/img2.png',
    subCategories: [],
  ),
  CategoryItem(
    id: 'oil9',
    name: 'Bộ Lọc Dầu',
    imageUrl: 'assets/images/img2.png',
    subCategories: [],
  ),
];
