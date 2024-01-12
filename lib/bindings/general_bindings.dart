import 'package:cwt_ecommerce_ui_kit/features/authentication/controllers/auth/auth_controller.dart';
import 'package:get/get.dart';

import '../features/shop/controllers/brand_controller.dart';
import '../features/personalization/controllers/address_controller.dart';
import '../features/personalization/controllers/user_controller.dart';
import '../features/shop/controllers/cart_controller.dart';
import '../features/shop/controllers/categories_controller.dart';
import '../features/shop/controllers/checkout_controller.dart';
import '../features/shop/controllers/product_controller.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    /// -- Product Controllers
    Get.put(ProductController(), permanent: true);
    Get.put(CartController(), permanent: true);
    Get.put(CheckoutController(), permanent: true);
    Get.put(CategoryController(), permanent: true);
    Get.put(BrandController(), permanent: true);

    /// -- User Controllers
    Get.put(UserController(), permanent: true);
    Get.put(AddressController(), permanent: true);
    Get.put(AuthController(), permanent: true);
  }
}
