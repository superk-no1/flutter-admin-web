import 'package:admin_web/common/constants.dart';
import 'package:admin_web/common/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'router/routes.dart';

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
    return MaterialApp.router(
      title: Constants.webName,

      /// 样式
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,

      /// 路由配置
      routerDelegate: Routes.router.routerDelegate,
      routeInformationParser: Routes.router.routeInformationParser,
      routeInformationProvider: Routes.router.routeInformationProvider,

      /// debug banner是否显示
      debugShowCheckedModeBanner: false,
    );
  }
}
