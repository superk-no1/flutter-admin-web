import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class ConfigService extends GetxService {

  static ConfigService get to => Get.find();

  PackageInfo? _platform;
  String get version => _platform?.version ?? '-';

  @override
  void onReady() {
    super.onReady();
    getPlatform();
  }

  Future<void> getPlatform() async {
    _platform = await PackageInfo.fromPlatform();
  }
}