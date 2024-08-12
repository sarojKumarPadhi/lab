import 'dart:io';

import 'package:zonk_rider/src/domain_layer/usecases/common_usecase/camera_image_picker.dart';
import 'package:zonk_rider/src/domain_layer/usecases/common_usecase/gallery_image_picker.dart';
import 'package:zonk_rider/src/domain_layer/usecases/authentication_usecase/registration_four_usecase.dart';
import 'package:zonk_rider/src/domain_layer/usecases/common_usecase/upload_doc.dart';
import 'package:zonk_rider/src/shared/widgets/image_picker_bottomsheet.dart';

import '../../../../../core/app_exports.dart';
import '../../../../../core/utils/enums.dart';

class RegistrationFourController extends GetxController {
  RegistrationFourController(
      this._cameraImagePicker,
      this._galleryImagePickerUsecase,
      this._uploadDocUseCase,
      this._registrationFourUsecase);
  final CameraImagePicker _cameraImagePicker;
  final GalleryImagePickerUsecase _galleryImagePickerUsecase;
  final UploadDocUseCase _uploadDocUseCase;
  final RegistrationFourUsecase _registrationFourUsecase;
  final formKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;

  Rxn<File> aadharImageFile = Rxn(null);
  Rxn<File> panImageFile = Rxn(null);
  Rxn<File> bankPassBookImageFile = Rxn(null);
  Rxn<File> educationImageFile = Rxn(null);

  void onTapAadhar() {
    imagePickerBottomSheet(
      onTapGallery: () {
        _galleryImagePickerUsecase().then(
          (value) {
            value.fold(
              (l) {},
              (r) {
                aadharImageFile(r);
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
                aadharImageFile(r);
              },
            );
          },
        );
        Get.back();
      },
    );
  }

  void onTapPan() {
    imagePickerBottomSheet(
      onTapGallery: () {
        _galleryImagePickerUsecase().then(
          (value) {
            value.fold(
              (l) {},
              (r) {
                panImageFile(r);
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
                panImageFile(r);
              },
            );
          },
        );
        Get.back();
      },
    );
  }

  void onTapBanPassbook() {
    imagePickerBottomSheet(
      onTapGallery: () {
        _galleryImagePickerUsecase().then(
          (value) {
            value.fold(
              (l) {},
              (r) {
                bankPassBookImageFile(r);
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
                bankPassBookImageFile(r);
              },
            );
          },
        );
        Get.back();
      },
    );
  }

  void onTapEduction() {
    imagePickerBottomSheet(
      onTapGallery: () {
        _galleryImagePickerUsecase().then(
          (value) {
            value.fold(
              (l) {},
              (r) {
                educationImageFile(r);
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
                educationImageFile(r);
              },
            );
          },
        );
        Get.back();
      },
    );
  }

  Future<void> regiFourset() async {
    if (aadharImageFile.value == null ||
        panImageFile.value == null ||
        bankPassBookImageFile.value == null ||
        educationImageFile.value == null) {
      snackbar(
          title: "Warning",
          message: "  'Alert', 'Please select all required images.",
          type: MsgType.warning);
    } else {
      isLoading(true);
      await _uploadDocUseCase(UploadDocParam(data: [
        aadharImageFile.value!,
        panImageFile.value!,
        bankPassBookImageFile.value!,
        educationImageFile.value!
      ])).then(
        (value) {
          value.fold(
            (l) => snackbar(
                title: "Error", message: l.message, type: MsgType.failure),
            (r) async {
              Log.debug(r);
              await _registrationFourUsecase(RegistrationFourParams(
                      aadharUrl: r[0],
                      bankPassBookUrl: r[1],
                      educationCertificateUrl: r[2],
                      panCardUrl: r[3]))
                  .then(
                (value) {
                  value.fold(
                    (l) => snackbar(
                        title: "Error",
                        message: l.message,
                        type: MsgType.failure),
                    (r) {
                      //! Go To Netx Page
                      Get.offNamed(AppRoutes.REG_STEP_FIVE_SCREEN);
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
