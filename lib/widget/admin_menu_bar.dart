import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:get/get.dart';

import '../routers/names.dart';

class AdminMenuBar extends SideBar {
  AdminMenuBar({super.key})
      : super(
            items: _buildMenuItems(),
            selectedRoute: Routes.home,
            onSelected: (adminMenuItem) {
              if (adminMenuItem.route != null) {
                Get.offNamed(adminMenuItem.route!);
              }
            });

  static List<AdminMenuItem> _buildMenuItems() {
    return [
      const AdminMenuItem(
        icon: Icons.shop,
        title: '商品管理',
        children: [
          AdminMenuItem(
            title: '商品列表',
            route: Routes.productList,
          ),
          AdminMenuItem(
            title: '商品分类',
            route: Routes.productCategory,
          ),
        ],
      ),
      const AdminMenuItem(
        icon: Icons.settings,
        title: '订单管理',
        route: Routes.order,
      ),
      const AdminMenuItem(
        icon: Icons.android,
        title: 'AI助理',
        route: Routes.aiChat,
      ),
      const AdminMenuItem(
        icon: Icons.account_circle,
        title: '关于作者',
        route: Routes.about,
      ),
    ];
  }
}
