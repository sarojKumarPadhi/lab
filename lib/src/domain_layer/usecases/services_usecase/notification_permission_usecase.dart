import 'dart:io';

import 'package:permission_handler/permission_handler.dart';

import '../../../../core/data_layer_exports.dart';
import '../../../../core/utils/enums.dart';

class NotificationPermissionUsecase implements UsecaseWithoutParams<bool> {
  @override
  ResultFutureT<bool> call() async {
    return await requestNotificationPermission().then(
      (value) => value.fold(
        (l) => Left(l),
        (r) {
          return Right(r);
        },
      ),
    );
  }

  ResultFutureT<bool> requestNotificationPermission() async {
    var status = await Permission.notification.request();
    if (Platform.isAndroid) {
      if (status == PermissionStatus.denied) {
        return Left(OtherFailure(
            message:
                "Please Allow Notification Permission To get Booking Notification",
            code: PermissionExceptiontype.notificationDenied.name));
      }
      if (status == PermissionStatus.permanentlyDenied) {
        return Left(OtherFailure(
            message: "Please Allow Location Permission In App Settings",
            code: PermissionExceptiontype.locationAlwaysDenied.name));
      } else if (status == PermissionStatus.granted) {
        return const Right(true);
      }
    }

    ///! For IOS Location  Permission
    else if (Platform.isIOS) {
      if (status == PermissionStatus.denied) {
        return Left(OtherFailure(
            message:
                "Please Allow Notification Permission To get Booking Notification",
            code: PermissionExceptiontype.notificationDenied.name));
      }
      if (status == PermissionStatus.permanentlyDenied) {
        return Left(OtherFailure(
            message: "Please Allow Location Permission In App Settings",
            code: PermissionExceptiontype.locationAlwaysDenied.name));
      } else if (status == PermissionStatus.granted) {
        return const Right(true);
      }
    }
    return const Right(false);
  }
}
