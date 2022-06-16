import 'package:flutter/material.dart';

import '../../screens/pharmacy/pharmacy.dart';
import '../../screens/navigation_screen.dart';
import '../../screens/pharmacy/categories.dart';
import '../../screens/pharmacy/category_details.dart';
import '../../screens/pharmacy/cart.dart';
import '../../screens/pharmacy/product_details.dart';

// Defines established routes in the application
class Routes {
  static const navScreen = '/';
  static const pharmacy = '/pharmacy';
  static const categories = '/categories';
  static const categoryDetails = '/category-details';
  static const productDetails = '/product-details';
  static const cart = '/cart';

  // Route generator.
  Map<String, Widget Function(BuildContext)> generateRoutes(BuildContext context) {
    return {
      navScreen: (ctx) => const NavigationScreen(),
      pharmacy: (ctx) => const Pharmacy(),
      categories: (ctx) => const Categories(),
      categoryDetails: (ctx) => const CategoryDetails(),
      productDetails: (ctx) => const ProductDetails(),
      cart: (ctx) => const Cart()
    };
  }
}