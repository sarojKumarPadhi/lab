import 'package:get/get.dart';

import '../../../../domain_layer/repositories/authentication_repository.dart';
import '../../../../domain_layer/usecases/authentication_usecase/login_uscase.dart';
import '../controller/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => LoginUserUseCase(Get.find<AuthenticationRepository>()),
    );
    Get.lazyPut(() => LoginController(Get.find<LoginUserUseCase>()));
  }
}
