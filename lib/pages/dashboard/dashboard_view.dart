import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dashboard_logic.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  final logic = Get.put(DashBoardLogic());
  final state = Get.find<DashBoardLogic>().state;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('dashboard'),
    );
  }
}
