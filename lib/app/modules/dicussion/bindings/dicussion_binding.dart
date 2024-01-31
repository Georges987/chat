import 'package:get/get.dart';

import '../controllers/dicussion_controller.dart';

class DicussionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DicussionController>(
      () => DicussionController(),
    );
  }
}
