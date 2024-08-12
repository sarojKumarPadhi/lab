import 'package:get/get.dart';

import '../../../../domain_layer/repositories/authentication_repository.dart';
import '../../../../domain_layer/repositories/common_api_repository.dart';
import '../../../../domain_layer/repositories/local_storage_repository.dart';
import '../../../../domain_layer/usecases/authentication_usecase/registration_two_usecase.dart';
import '../../../../domain_layer/usecases/common_usecase/fetch_city.dart';
import '../../../../domain_layer/usecases/common_usecase/fetch_state.dart';
import '../controller/registration_two_controller.dart';

class RegistrationTwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FetchState(Get.find<CommonApiRepository>()));
    Get.lazyPut(() => FetchCity(Get.find<CommonApiRepository>()));
    Get.lazyPut(() => RegistrationTwoUsecase(
        Get.find<AuthenticationRepository>(),
        Get.find<LocalStorageRepository>()));
    Get.lazyPut(() => RegistrationTwoController(Get.find<FetchState>(),
        Get.find<FetchCity>(), Get.find<RegistrationTwoUsecase>()));
  }
}
