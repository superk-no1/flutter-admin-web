import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'order_logic.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final logic = Get.put(OrderLogic());
  final state = Get.find<OrderLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void dispose() {
    Get.delete<OrderLogic>();
    super.dispose();
  }
}
