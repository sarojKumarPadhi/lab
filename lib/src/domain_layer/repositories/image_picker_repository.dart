import 'dart:io';

import '../../../core/data_layer_exports.dart';

abstract class ImagePickerRepository {
  ResultFutureT<File?> pickImageFromCamera();
  ResultFutureT<File?> pickImageFromGaller();
}
