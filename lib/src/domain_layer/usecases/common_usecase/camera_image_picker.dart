import 'dart:io';

import '../../../../core/data_layer_exports.dart';
import '../../repositories/image_picker_repository.dart';

class CameraImagePicker implements UsecaseWithoutParams<File?> {
  CameraImagePicker(this._imagePickerRepository);
  final ImagePickerRepository _imagePickerRepository;
  @override
  ResultFutureT<File?> call() {
    return _imagePickerRepository.pickImageFromCamera();
  }
}
