import 'package:admin_web/pages/order/order_view.dart';
import 'package:admin_web/pages/product/product_category/product_category_view.dart';
import 'package:admin_web/pages/product/product_list/product_list_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/home/home_view.dart';

class Routes {
  static final RouteObserver<Route> observer = RouteObserver();
  static List<String> history = [];

  static const String home = '/home';
  static const String product = '/product';
  static const String productList = '/productList';
  static const String productCategory = '/productCategory';
  static const String order = '/order';

  static final List<GetPage> getPages = [
    GetPage(name: home, page: () => const HomePage()),
    GetPage(
        name: product,
        page: () => Container(),
        transition: Transition.noTransition,
        children: [
          GetPage(
            name: productList,
            page: () => const ProductListPage(),
            transition: Transition.noTransition,
          ),
          GetPage(
            name: productCategory,
            page: () => const ProductCategoryPage(),
            transition: Transition.noTransition,
          )
        ]),
    GetPage(
        name: order,
        page: () => const OrderPage(),
        maintainState: true,
        transition: Transition.noTransition),
  ];
}
