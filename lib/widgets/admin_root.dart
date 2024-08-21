import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:go_router/go_router.dart';

import '../common/constants.dart';
import '../router/routes.dart';

class RootScaffold extends StatelessWidget {
  final Widget child;

  const RootScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(Constants.webName),
      ),
      sideBar: SideBar(
        items: const [
          AdminMenuItem(icon: Icons.home, title: '主页', route: Routes.dashboard),
          AdminMenuItem(icon: Icons.shop, title: '商品管理', children: [
            AdminMenuItem(
              title: '商品列表',
              route: Routes.goodsList,
            ),
            AdminMenuItem(title: '商品分类', route: Routes.goodsCategory),
          ]),
        ],
        selectedRoute: Routes.dashboard,
        onSelected: (adminMenuItem) {
          if (adminMenuItem.route != null) {
            GoRouter.of(context).go(adminMenuItem.route!);
          }
        },
      ),
      body: child,
    );
  }
}
