import 'package:get/get.dart';

import 'package:zonk_rider/src/domain_layer/usecases/common_usecase/fetch_banks.dart';

import '../../../../domain_layer/repositories/authentication_repository.dart';
import '../../../../domain_layer/repositories/common_api_repository.dart';
import '../../../../domain_layer/repositories/local_storage_repository.dart';
import '../../../../domain_layer/usecases/authentication_usecase/registration_three_usecase.dart';
import '../controller/registration_three_controller.dart';

class RegistrationThreeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FetchBanks(Get.find<CommonApiRepository>()));

    Get.lazyPut(() => RegistrationThreeUsecase(
        Get.find<AuthenticationRepository>(),
        Get.find<LocalStorageRepository>()));
    Get.lazyPut(() => RegistrationThreeController(
        Get.find<FetchBanks>(), Get.find<RegistrationThreeUsecase>()));
  }
}
