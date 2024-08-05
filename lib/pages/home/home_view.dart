import 'package:admin_web/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_logic.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final logic = Get.put(HomeLogic());
  final state = Get.find<HomeLogic>().state;

  final List<String> _menuItems = [
    '子项一',
    '子项二',
    '子项三',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildLeftSideView(),
      body: _buildMainView(),
    );
  }

  Widget _buildMainView() {
    return Row(
      children: [
        _buildLeftSideView(),
        Expanded(
          child: _buildContent(),
        ),
      ],
    );
  }

  Widget _buildLeftSideView() {
    return Container(
      width: 250,
      color: Colors.black26,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _buildLogoView(),
          _buildSubMenuView('系统管理'),
          _buildSubMenuView('用户列表'),
          _buildSubMenuView('关于作者'),
        ],
      ),
    );
  }

  Widget _buildLogoView() {
    return Container(
      height: 100,
      decoration: const BoxDecoration(
        color: Colors.blue,
      ),
      child: const Center(
        child: Text(
          Constants.webName,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ),
    );
  }

  Widget _buildSubMenuView(String title) {
    return ExpansionTile(
      title: Text(title),
      childrenPadding: const EdgeInsets.only(left: 12),
      children: _menuItems.map((item) {
        return ListTile(
          title: Text(item),
          onTap: () {
            // Handle item tap
          },
        );
      }).toList(),
    );
  }

  Widget _buildContent() {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      child: const Center(
        child: Text(
          'Welcome to Admin Panel',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<HomeLogic>();
    super.dispose();
  }
}
