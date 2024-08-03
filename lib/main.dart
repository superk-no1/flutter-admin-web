import 'package:admin_web/common/constants.dart';
import 'package:admin_web/common/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'routers/names.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  launchApp();
}

void launchApp() {
  initData();
  runApp(const MyApp());
}

void initData() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: Constants.appName,

      /// 样式
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,

      /// 路由
      initialRoute: Routes.home,
      getPages: Routes.getPages,
      navigatorObservers: [Routes.observer],

      /// debug banner是否显示
      debugShowCheckedModeBanner: false,
    );
  }
}
