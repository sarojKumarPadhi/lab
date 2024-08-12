import 'dart:io';

import 'package:jonk_lab/core/data_layer_exports.dart';

import '../../repositories/image_picker_repository.dart';

class GalleryImagePickerUsecase implements UsecaseWithoutParams<File?> {
  GalleryImagePickerUsecase(this._imagePickerRepository);
  final ImagePickerRepository _imagePickerRepository;
  @override
  ResultFutureT<File?> call() {
    return _imagePickerRepository.pickImageFromGaller();
  }
}
