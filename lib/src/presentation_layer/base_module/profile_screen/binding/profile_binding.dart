import 'package:get/get.dart';
import 'package:zonk_rider/src/presentation_layer/base_module/profile_screen/controller/profile_screen_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
  }
}
