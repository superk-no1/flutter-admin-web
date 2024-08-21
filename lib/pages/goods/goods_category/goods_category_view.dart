import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'goods_category_logic.dart';

class GoodsCategoryPage extends StatefulWidget {
  const GoodsCategoryPage({super.key});

  @override
  State<GoodsCategoryPage> createState() => _GoodsCategoryPageState();
}

class _GoodsCategoryPageState extends State<GoodsCategoryPage> {
  final logic = Get.put(GoodsCategoryLogic());
  final state = Get.find<GoodsCategoryLogic>().state;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('goodsCategory'),
    );
  }
}
