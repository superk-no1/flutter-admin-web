import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/home/home_view.dart';

class Routes {
  static final RouteObserver<Route> observer = RouteObserver();
  static List<String> history = [];

  static const String home = '/home';

  static final List<GetPage> getPages = [
    GetPage(name: home, page: () => const HomePage()),
  ];
}
