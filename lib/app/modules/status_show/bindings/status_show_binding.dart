import 'package:get/get.dart';

import '../controllers/status_show_controller.dart';

class StatusShowBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StatusShowController>(
      () => StatusShowController(),
    );
  }
}
