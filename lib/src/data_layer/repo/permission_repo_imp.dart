import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../domain_layer/repositories/permission_repository.dart';

class PermissionRepoImp implements PermissionRepository {
  @override
  Future<PermissionStatus> checkCameraPermissionRepo() async {
    return await Permission.camera.status;
  }

  @override
  Future<PermissionStatus> requestCameraPermissionRepo() async {
    return await Permission.camera.request();
  }

  @override
  Future<PermissionStatus> checkGalleryPermissionRepo() async {
    if (Platform.isAndroid) {
      final androidInfo = await DeviceInfoPlugin().androidInfo;

      if (androidInfo.version.sdkInt <= 32) {
        return await Permission.storage.status;
      } else {
        return await Permission.photos.status;
      }
    } else {
      final iosInfo = await DeviceInfoPlugin().iosInfo;
      final iosVersion = iosInfo.systemVersion;

      final versionParts = iosVersion.split('.').map(int.parse).toList();

      bool isIOS14OrAbove = (versionParts[0] > 14) ||
          (versionParts[0] == 14 && versionParts[1] >= 0);
      if (isIOS14OrAbove) {
        return await Permission.photos.status;
      } else {
        return await Permission.mediaLibrary.status;
      }
    }
  }

  @override
  Future<PermissionStatus> requestGalleryPermissionRepo() async {
    if (Platform.isAndroid) {
      final androidInfo = await DeviceInfoPlugin().androidInfo;

      if (androidInfo.version.sdkInt <= 32) {
        return await Permission.storage.request();
      } else {
        return await Permission.photos.request();
      }
    } else {
      final iosInfo = await DeviceInfoPlugin().iosInfo;
      final iosVersion = iosInfo.systemVersion;

      final versionParts = iosVersion.split('.').map(int.parse).toList();

      bool isIOS14OrAbove = (versionParts[0] > 14) ||
          (versionParts[0] == 14 && versionParts[1] >= 0);
      if (isIOS14OrAbove) {
        return await Permission.photos.request();
      } else {
        return await Permission.mediaLibrary.request();
      }
    }
  }
}
