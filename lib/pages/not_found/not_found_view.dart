import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'not_found_logic.dart';

class NotFoundPage extends StatefulWidget {
  const NotFoundPage({super.key});

  @override
  State<NotFoundPage> createState() => _NotFoundPageState();
}

class _NotFoundPageState extends State<NotFoundPage> {
  final logic = Get.put(NotFoundLogic());
  final state = Get.find<NotFoundLogic>().state;

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('404'),);
  }

  @override
  void dispose() {
    Get.delete<NotFoundLogic>();
    super.dispose();
  }
}