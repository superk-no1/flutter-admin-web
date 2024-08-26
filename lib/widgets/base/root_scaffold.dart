import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';

import '../../router/routes.dart';

class RootScaffold extends StatelessWidget {
  final Widget child;

  const RootScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Super Admin'),
      ),
      sideBar: SideBar(
        items: const [
          AdminMenuItem(
              icon: Icons.home, title: '主页', route: RouteManager.dashboard),
          AdminMenuItem(icon: Icons.shop, title: '商品管理', children: [
            AdminMenuItem(
              title: '商品列表',
              route: RouteManager.goodsList,
            ),
            AdminMenuItem(title: '商品分类', route: RouteManager.goodsCategory),
          ]),
        ],
        selectedRoute: RouteManager.dashboard,
        onSelected: (adminMenuItem) {
          if (adminMenuItem.route != null) {
            RouteManager.router.go(adminMenuItem.route!);
          }
        },
      ),
      body: Column(
        children: [_buildTopBar(), child],
      ),
    );
  }

  Widget _buildTopBar() {
    return Container(
      height: 60,
      color: Colors.black12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [_buildBreadcrumb()],
      ),
    );
  }

  Widget _buildBreadcrumb() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        RouteManager.currentBreadcrumbStr,
        style: const TextStyle(color: Colors.grey),
      ),
    );
  }
}
