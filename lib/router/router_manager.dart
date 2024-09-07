import 'package:admin_web/pages/goods/goods_category/goods_category_view.dart';
import 'package:admin_web/pages/goods/goods_list/goods_list_view.dart';
import 'package:admin_web/pages/not_found/not_found_view.dart';
import 'package:admin_web/utils/storage_helper.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../pages/dashboard/dashboard_view.dart';
import '../widgets/base/root_scaffold.dart';
import '../widgets/base/transition_page.dart';
import 'router_observers.dart';

class RouterManager {
  static const String dashboard = '/dashboard';
  static const String goodsList = '/goods/goodsList';
  static const String goodsCategory = '/goods/goodsCategory';
  static const String notFound = '/404';

  static String get restoreRoute {
    var url = StorageHelper.instance.getStr('restore_route');
    if (url.isNotEmpty) return url;
    return dashboard;
  }

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
            GoRoute(
                path: notFound,
                pageBuilder: (context, state) {
                  return FadeTransitionPage(
                    child: const NotFoundPage(),
                  );
                }),
          ],
        ),
      ],
      initialLocation: restoreRoute,
      navigatorKey: navigatorKey,
      observers: [GoRouteObserver()]);

  static final List<MenuItemWithRoute> _menuList = [
    MenuItemWithRoute(
      index: 0,
      title: '主页',
      icon: Icons.home,
      route: dashboard,
    ),
    MenuItemWithRoute(
      index: 1,
      title: '商品管理',
      icon: Icons.shop,
      children: [
        MenuItemWithRoute(
            index: 2, title: '商品列表', icon: Icons.list, route: goodsList),
        MenuItemWithRoute(
            index: 3,
            title: '商品分类',
            icon: Icons.list_alt,
            route: goodsCategory),
      ],
    )
  ];

  static List<fluent.NavigationPaneItem> get adaptMenuItems {
    return _menuList.map((item) {
      final children = item.children;
      if (children != null) {
        return fluent.PaneItemExpander(
            initiallyExpanded: true,
            icon: Icon(item.icon),
            title: Text(item.title),
            body: const SizedBox.shrink(),
            items: children
                .map((e) => fluent.PaneItem(
                      icon: Icon(e.icon),
                      title: Text(e.title),
                      body: const SizedBox.shrink(),
                      selectedTileColor: WidgetStateProperty.all(Colors.blue),
                    ) as fluent.NavigationPaneItem)
                .toList());
      }
      return fluent.PaneItem(
        icon: Icon(item.icon),
        title: Text(item.title),
        body: const SizedBox.shrink(),
        selectedTileColor: WidgetStateProperty.all(Colors.blue),
      ) as fluent.NavigationPaneItem;
    }).toList();
  }

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

  static String? _findRoute(List<MenuItemWithRoute> menuList, int index) {
    for (var item in menuList) {
      if (item.index == index) {
        return item.route;
      }
      if (item.children != null) {
        var route = _findRoute(item.children!, index);
        if (route != null) {
          return route;
        }
      }
    }
    return null;
  }

  static void goByIndex(int index) {
    var route = _findRoute(_menuList, index);
    if (route != null) {
      StorageHelper.instance.setStr('restore_route',
          router.routeInformationProvider.value.uri.toString());
      router.go(route);
    }
  }

  static void showNormalDialog({
    required Widget Function(BuildContext context) builder,
  }) {
    showDialog(
      context: navigatorKey.currentContext!,
      builder: builder,
    );
  }
}

class MenuItemWithRoute {
  final int index;
  final String title;
  final IconData icon;
  final String? route;
  final List<MenuItemWithRoute>? children;

  MenuItemWithRoute(
      {required this.index,
      required this.title,
      required this.icon,
      this.route,
      this.children});
}
