import 'package:f22_task/app/repo/app_repo.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppRepository());
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
