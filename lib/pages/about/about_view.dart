import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:get/get.dart';

import '../../common/constants.dart';
import '../../widget/admin_menu_bar.dart';
import 'about_logic.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final logic = Get.put(AboutLogic());
  final state = Get.find<AboutLogic>().state;

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
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '关于我',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'XXX',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 24),
          Text(
            '联系方式',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Icon(Icons.email),
              SizedBox(width: 8),
              Text('1844118002@qq.com', style: TextStyle(fontSize: 16)),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.phone),
              SizedBox(width: 8),
              Text('+123 456 7890', style: TextStyle(fontSize: 16)),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.web),
              SizedBox(width: 8),
              Text('https://www.xxx.com', style: TextStyle(fontSize: 16)),
            ],
          ),
        ],
      ),
    );
  }
}
