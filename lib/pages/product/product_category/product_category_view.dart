import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:get/get.dart';

import '../../../common/constants.dart';
import '../../../widget/admin_menu_bar.dart';
import 'product_category_logic.dart';

class ProductCategoryPage extends StatefulWidget {
  const ProductCategoryPage({super.key});

  @override
  State<ProductCategoryPage> createState() => _ProductCategoryPageState();
}

class _ProductCategoryPageState extends State<ProductCategoryPage> {
  final logic = Get.put(ProductCategoryLogic());
  final state = Get.find<ProductCategoryLogic>().state;

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
    return Center(child: Text('商品分类'));
  }
}
