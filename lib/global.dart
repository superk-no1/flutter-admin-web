import 'package:admin_web/services/config.dart';
import 'package:admin_web/services/http.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'utils/storage_helper.dart';

class Global {
  static Future<void> init() async {
    /// 将flutter和原生端接口进行初始化
    WidgetsFlutterBinding.ensureInitialized();

    Get.put<ConfigService>(ConfigService());
    Get.put<HttpService>(HttpService());

    await StorageHelper.instance.init();
  }
}
