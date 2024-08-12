import 'package:get/get.dart';
import 'package:zonk_rider/src/domain_layer/usecases/authentication_usecase/login_uscase.dart';

import '../../../../domain_layer/repositories/authentication_repository.dart';
import '../controller/under_verification_controller.dart';

class UnderVerificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => LoginUserUseCase(Get.find<AuthenticationRepository>()),
    );
    Get.lazyPut(
        () => UnderVerificationController(Get.find<LoginUserUseCase>()));
  }
}
