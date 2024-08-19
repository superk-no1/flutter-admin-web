import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:get/get.dart';

class AdminMenuBar extends SideBar {
  AdminMenuBar({super.key})
      : super(
            items: [
              AdminMenuItem(
                  icon: IconData(Icons.account_circle.codePoint),
                  title: '商品管理',
                  children: [
                    const AdminMenuItem(
                        title: '商品列表', route: '/product/productList'),
                    const AdminMenuItem(
                        title: '商品分类', route: '/product/productCategory'),
                  ]),
              AdminMenuItem(
                icon: IconData(Icons.settings.codePoint),
                title: '订单管理',
              ),
            ],
            selectedRoute: '/home',
            onSelected: (adminMenuItem) {
              if (adminMenuItem.route != null) {
                Get.offNamed(adminMenuItem.route!);
              }
            });
}
