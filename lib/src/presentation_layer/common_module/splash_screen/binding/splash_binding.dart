import 'package:get/get.dart';

import '../../../../domain_layer/repositories/local_storage_repository.dart';
import '../../../../domain_layer/usecases/common_usecase/splash_usecase.dart';
import '../controller/splash_screen_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashUsecase(Get.find<LocalStorageRepository>()));
    Get.put(SplashScreenController(Get.find<SplashUsecase>()));
  }
}
