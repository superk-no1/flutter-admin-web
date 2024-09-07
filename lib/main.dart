import 'package:admin_web/common/constants.dart';
import 'package:admin_web/common/styles/themes.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/services.dart';

import 'router/router_manager.dart';

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
    return FluentApp.router(
      title: Constants.webName,

      /// 样式
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,

      /// 路由配置
      routerDelegate: RouterManager.router.routerDelegate,
      routeInformationParser: RouterManager.router.routeInformationParser,
      routeInformationProvider: RouterManager.router.routeInformationProvider,

      /// debug banner是否显示
      debugShowCheckedModeBanner: false,
    );
  }
}
