import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/crud_table/crud_table_view.dart';
import 'goods_list_logic.dart';

class GoodsListPage extends StatefulWidget {
  const GoodsListPage({super.key});

  @override
  State<GoodsListPage> createState() => _GoodsListPageState();
}

class _GoodsListPageState extends State<GoodsListPage> {
  final logic = Get.put(GoodsListLogic());
  final state = Get.find<GoodsListLogic>().state;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CrudTableView(),
    );
  }
}
