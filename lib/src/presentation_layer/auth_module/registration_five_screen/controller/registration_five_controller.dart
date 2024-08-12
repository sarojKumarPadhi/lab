import 'dart:io';

import 'package:zonk_rider/src/domain_layer/usecases/common_usecase/camera_image_picker.dart';
import 'package:zonk_rider/src/domain_layer/usecases/common_usecase/gallery_image_picker.dart';
import 'package:zonk_rider/src/domain_layer/usecases/authentication_usecase/registration_five_usecase.dart';
import 'package:zonk_rider/src/domain_layer/usecases/authentication_usecase/registration_four_usecase.dart';
import 'package:zonk_rider/src/domain_layer/usecases/common_usecase/upload_doc.dart';
import 'package:zonk_rider/src/shared/widgets/image_picker_bottomsheet.dart';

import '../../../../../core/app_exports.dart';
import '../../../../../core/utils/enums.dart';

class RegistrationFiveController extends GetxController {
  RegistrationFiveController(
      this._cameraImagePicker,
      this._galleryImagePickerUsecase,
      this._uploadDocUseCase,
      this._registrationFiveUsecase);
  final CameraImagePicker _cameraImagePicker;
  final GalleryImagePickerUsecase _galleryImagePickerUsecase;
  final UploadDocUseCase _uploadDocUseCase;
  final RegistrationFiveUsecase _registrationFiveUsecase;
  final formKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;

  Rxn<File> selfie1ImageFile = Rxn(null);
  Rxn<File> selfie2ImageFile = Rxn(null);
  Rxn<File> bikeFrontImageFile = Rxn(null);
  Rxn<File> bikeBackImageFile = Rxn(null);

  void onTapSelfie1() {
    imagePickerBottomSheet(
      onTapGallery: () {
        _galleryImagePickerUsecase().then(
          (value) {
            value.fold(
              (l) {},
              (r) {
                selfie1ImageFile(r);
              },
            );
          },
        );
        Get.back();
      },
      onTapCamera: () {
        _cameraImagePicker().then(
          (value) {
            value.fold(
              (l) {},
              (r) {
                selfie1ImageFile(r);
              },
            );
          },
        );
        Get.back();
      },
    );
  }

  void onTapSelfie2() {
    imagePickerBottomSheet(
      onTapGallery: () {
        _galleryImagePickerUsecase().then(
          (value) {
            value.fold(
              (l) {},
              (r) {
                selfie2ImageFile(r);
              },
            );
          },
        );
        Get.back();
      },
      onTapCamera: () {
        _cameraImagePicker().then(
          (value) {
            value.fold(
              (l) {},
              (r) {
                selfie2ImageFile(r);
              },
            );
          },
        );
        Get.back();
      },
    );
  }

  void onTapBikeFront() {
    imagePickerBottomSheet(
      onTapGallery: () {
        _galleryImagePickerUsecase().then(
          (value) {
            value.fold(
              (l) {},
              (r) {
                bikeFrontImageFile(r);
              },
            );
          },
        );
        Get.back();
      },
      onTapCamera: () {
        _cameraImagePicker().then(
          (value) {
            value.fold(
              (l) {},
              (r) {
                bikeFrontImageFile(r);
              },
            );
          },
        );
        Get.back();
      },
    );
  }

  void onTapBikeBack() {
    imagePickerBottomSheet(
      onTapGallery: () {
        _galleryImagePickerUsecase().then(
          (value) {
            value.fold(
              (l) {},
              (r) {
                bikeBackImageFile(r);
              },
            );
          },
        );
        Get.back();
      },
      onTapCamera: () {
        _cameraImagePicker().then(
          (value) {
            value.fold(
              (l) {},
              (r) {
                bikeBackImageFile(r);
              },
            );
          },
        );
        Get.back();
      },
    );
  }

  Future<void> regiFiveset() async {
    if (selfie1ImageFile.value == null ||
        selfie2ImageFile.value == null ||
        bikeFrontImageFile.value == null ||
        bikeBackImageFile.value == null) {
      snackbar(
          title: "Warning",
          message: "  'Alert', 'Please select all required images.",
          type: MsgType.warning);
    } else {
      isLoading(true);
      await _uploadDocUseCase(UploadDocParam(data: [
        selfie1ImageFile.value!,
        selfie2ImageFile.value!,
        bikeFrontImageFile.value!,
        bikeBackImageFile.value!
      ])).then(
        (value) {
          value.fold(
            (l) => snackbar(
                title: "Error", message: l.message, type: MsgType.failure),
            (r) async {
              Log.debug(r);
              await _registrationFiveUsecase(RegistrationFiveParams(
                      selfie1Url: r[0],
                      selfie2Url: r[1],
                      bike1Url: r[2],
                      bike2Url: r[3]))
                  .then(
                (value) {
                  value.fold(
                    (l) => snackbar(
                        title: "Error",
                        message: l.message,
                        type: MsgType.failure),
                    (r) {
                      Get.offAllNamed(AppRoutes.UNDER_VERIFICATION_SCREEN);
                    },
                  );
                },
              );
            },
          );
        },
      );
      isLoading(false);
    }
  }
}
