import 'package:get/get.dart';

import '../../../../domain_layer/repositories/authentication_repository.dart';
import '../../../../domain_layer/repositories/local_storage_repository.dart';
import '../../../../domain_layer/usecases/authentication_usecase/verify_otp_usecase.dart';
import '../controller/otp_controller.dart';

class OTPBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VerifyOtpUseCase(Get.find<AuthenticationRepository>(),
        Get.find<LocalStorageRepository>()));
    Get.lazyPut(() => OTPController(Get.find<VerifyOtpUseCase>()));
  }
}
