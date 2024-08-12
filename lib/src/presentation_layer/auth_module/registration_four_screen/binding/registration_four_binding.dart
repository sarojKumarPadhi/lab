import 'package:get/get.dart';
import 'package:zonk_rider/src/data_layer/repo/image_picker_repo_imp.dart';
import 'package:zonk_rider/src/domain_layer/repositories/common_api_repository.dart';
import 'package:zonk_rider/src/domain_layer/repositories/image_picker_repository.dart';
import 'package:zonk_rider/src/domain_layer/usecases/common_usecase/camera_image_picker.dart';
import 'package:zonk_rider/src/domain_layer/usecases/common_usecase/gallery_image_picker.dart';
import 'package:zonk_rider/src/domain_layer/usecases/authentication_usecase/registration_four_usecase.dart';
import 'package:zonk_rider/src/domain_layer/usecases/common_usecase/upload_doc.dart';

import '../../../../domain_layer/repositories/authentication_repository.dart';
import '../../../../domain_layer/repositories/local_storage_repository.dart';
import '../controller/registration_four_controller.dart';

class RegistrationFourBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ImagePickerRepository>(() => ImagePickerRepoImp());
    Get.lazyPut(() => UploadDocUseCase(Get.find<CommonApiRepository>()));
    Get.lazyPut(() => CameraImagePicker(Get.find<ImagePickerRepository>()));

    Get.lazyPut(
        () => GalleryImagePickerUsecase(Get.find<ImagePickerRepository>()));
    Get.lazyPut(() => RegistrationFourUsecase(
        Get.find<AuthenticationRepository>(),
        Get.find<LocalStorageRepository>()));
    Get.lazyPut(() => RegistrationFourController(
        Get.find<CameraImagePicker>(),
        Get.find<GalleryImagePickerUsecase>(),
        Get.find<UploadDocUseCase>(),
        Get.find<RegistrationFourUsecase>()));
  }
}
