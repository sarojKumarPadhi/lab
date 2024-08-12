import 'dart:io';

import 'package:image_picker/image_picker.dart';

import '../../../core/data_layer_exports.dart';
import '../../domain_layer/repositories/image_picker_repository.dart';

class ImagePickerRepoImp implements ImagePickerRepository {
  final _imagePicker = ImagePicker();
  @override
  ResultFutureT<File?> pickImageFromCamera() async {
    try {
      final pickedFile =
          await _imagePicker.pickImage(source: ImageSource.camera);
      return Right(pickedFile != null ? File(pickedFile.path) : null);
    } catch (e) {
      return Left(OtherFailure.fromException(e));
    }
  }

  @override
  ResultFutureT<File?> pickImageFromGaller() async {
    try {
      final pickedFile =
          await _imagePicker.pickImage(source: ImageSource.gallery);
      return Right(pickedFile != null ? File(pickedFile.path) : null);
    } catch (e) {
      return Left(OtherFailure.fromException(e));
    }
  }
}
