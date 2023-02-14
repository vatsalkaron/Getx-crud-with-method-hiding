import 'package:get/get.dart';
import 'package:testgetx/screen/home/ui/add_product.dart';
import 'package:testgetx/screen/home/bindings/home_binding.dart';
import 'package:testgetx/screen/home/ui/product_screen.dart';
part 'app_routes.dart';

// ignore: avoid_classes_with_only_static_members
class AppPages {
  static const INITIAL = Routes.PRODUCT;

  static final routes = [
    GetPage(
      name: Routes.PRODUCT,
      page: () => ProductScreen(),
      binding: HomeBinding(),
      children: [
        GetPage(
          name: Routes.ADDPRODUCT,
          page: () => AddProduct(),
        ),
      ],
    ),
  ];
}
