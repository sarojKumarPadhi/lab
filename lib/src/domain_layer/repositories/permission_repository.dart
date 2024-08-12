import 'package:permission_handler/permission_handler.dart';

abstract class PermissionRepository {
  const PermissionRepository();

  Future<PermissionStatus> checkCameraPermissionRepo();
  Future<PermissionStatus> requestCameraPermissionRepo();
  Future<PermissionStatus> checkGalleryPermissionRepo();
  Future<PermissionStatus> requestGalleryPermissionRepo();
}
