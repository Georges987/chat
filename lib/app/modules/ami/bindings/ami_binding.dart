import 'package:get/get.dart';

import '../controllers/ami_controller.dart';

class AmiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AmiController>(
      () => AmiController(),
    );
  }
}
