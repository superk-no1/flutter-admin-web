import 'package:admin_web/pages/goods/goods_category/goods_category_view.dart';
import 'package:admin_web/pages/goods/goods_list/goods_list_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../pages/dashboard/dashboard_view.dart';
import '../widgets/base/root_scaffold.dart';
import '../widgets/base/transition_page.dart';
import 'observers.dart';

class RouteManager {
  static const String dashboard = '/dashboard';
  static const String goodsList = '/goods/goodsList';
  static const String goodsCategory = '/goods/goodsCategory';

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
      routes: [
        ShellRoute(
          builder: (context, state, child) {
            return RootScaffold(
              child: child,
            );
          },
          routes: [
            GoRoute(
                path: dashboard,
                pageBuilder: (context, state) {
                  return FadeTransitionPage(
                    child: const DashBoardPage(),
                  );
                }),
            GoRoute(
                path: goodsList,
                pageBuilder: (context, state) {
                  return FadeTransitionPage(
                    child: const GoodsListPage(),
                  );
                }),
            GoRoute(
                path: goodsCategory,
                pageBuilder: (context, state) {
                  return FadeTransitionPage(
                    child: const GoodsCategoryPage(),
                  );
                }),
          ],
        ),
      ],
      initialLocation: dashboard,
      navigatorKey: navigatorKey,
      observers: [GoRouteObserver()]);

  static String get currentBreadcrumbStr {
    Map<String, String> routeMapping = {
      'dashboard': '主页',
      'goods': '商品模块',
      'goodsList': '商品列表',
      'goodsCategory': '商品分类',
    };
    Uri uri = router.routeInformationProvider.value.uri;
    List<String> tagList = [];
    List<String> pathSegments = uri.pathSegments;
    for (var segment in pathSegments) {
      if (routeMapping.containsKey(segment)) {
        tagList.add(routeMapping[segment]!);
      }
    }
    return tagList.join(' > ');
  }
}
