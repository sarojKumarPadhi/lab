import 'package:get/get.dart';

import '../../../../domain_layer/repositories/authentication_repository.dart';
import '../../../../domain_layer/repositories/local_storage_repository.dart';
import '../../../../domain_layer/usecases/authentication_usecase/registration_one_usecase.dart';
import '../controller/registration_one_controller.dart';

class RegistrationOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegistrationOneUsecase(
        Get.find<AuthenticationRepository>(),
        Get.find<LocalStorageRepository>()));
    Get.lazyPut(
        () => RegistrationOneController(Get.find<RegistrationOneUsecase>()));
  }
}
