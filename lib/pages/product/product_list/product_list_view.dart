import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:get/get.dart';

import '../../../common/constants.dart';
import '../../../widget/admin_menu_bar.dart';
import 'product_list_logic.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  final logic = Get.put(ProductListLogic());
  final state = Get.find<ProductListLogic>().state;

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(Constants.webName),
      ),
      sideBar: AdminMenuBar(),
      body: _buildMain(),
    );
  }

  Widget _buildMain() {
    return Center(child: Text('商品列表'));
  }
}
