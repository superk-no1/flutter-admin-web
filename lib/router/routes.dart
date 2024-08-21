import 'package:admin_web/pages/goods/goods_category/goods_category_view.dart';
import 'package:admin_web/pages/goods/goods_list/goods_list_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../pages/dash_board/dash_board_view.dart';
import '../widgets/admin_root.dart';

class Routes {
  static const String login = '/login';
  static const String dashboard = '/dashboard';
  static const String goodsList = '/goodsList';
  static const String goodsCategory = '/goodsCategory';

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
                builder: (context, state) {
                  return const DashBoardPage();
                }),
            GoRoute(
                path: goodsList,
                builder: (context, state) {
                  return const GoodsListPage();
                }),
            GoRoute(
                path: goodsCategory,
                builder: (context, state) {
                  return const GoodsCategoryPage();
                }),
          ],
        ),
      ],
      initialLocation: dashboard,
      observers: [RouteObserver()]);
}
