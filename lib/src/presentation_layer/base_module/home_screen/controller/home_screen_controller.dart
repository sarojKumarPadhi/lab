import 'package:zonk_rider/core/app_exports.dart';
import 'package:zonk_rider/core/errors/failure.dart';
import 'package:zonk_rider/src/domain_layer/entities/user_detail_entities.dart';
import 'package:zonk_rider/src/domain_layer/usecases/basic_module_usecase/get_user_detail_usecase.dart';
import 'package:zonk_rider/src/domain_layer/usecases/basic_module_usecase/logout_usecase.dart';
import 'package:zonk_rider/src/domain_layer/usecases/services_usecase/notification_permission_usecase.dart';

import '../../../../domain_layer/usecases/services_usecase/location_permission_usecase.dart';

class HomeScreenController extends GetxController {
  HomeScreenController(this._userDetailUsecase, this._logoutUsecase,
      this._locationPermissionUsecase, this._notificationPermissionUsecase);
  final GetUserDetailUsecase _userDetailUsecase;
  final LogoutUsecase _logoutUsecase;
  final LocationPermissionUsecase _locationPermissionUsecase;
  final NotificationPermissionUsecase _notificationPermissionUsecase;
  RxBool isLoading = false.obs;
  RxBool locationLoader = false.obs;

  RxBool dutyStatus = false.obs;
  RxBool accountStatus = true.obs;
  RxnString currentAddressName = RxnString();
  RxnString warningMsg = RxnString();
  Rx<UserDetailEntities> userData = UserDetailEntities().obs;

  @override
  void onInit() {
    getUserDetail();
    getLocation();
    super.onInit();
  }

  Future<void> getUserDetail() async {
    isLoading(true);
    await _userDetailUsecase().then(
      (value) {
        value.fold(
          (l) {
            snackbar(title: l.code, message: l.message, type: MsgType.failure);
          },
          (r) {
            accountStatus(r.accountStatus);
            if (r.registrationStep == 1) {
              Get.offNamed(AppRoutes.REG_STEP_ONE_SCREEN);
            } else if (r.registrationStep == 2) {
              Get.offNamed(AppRoutes.REG_STEP_TWO_SCREEN);
            } else if (r.registrationStep == 3) {
              Get.offNamed(AppRoutes.REG_STEP_THREE_SCREEN);
            } else if (r.registrationStep == 4) {
              Get.offNamed(AppRoutes.REG_STEP_FOUR_SCREEN);
            } else if (r.registrationStep == 5) {
              Get.offNamed(AppRoutes.REG_STEP_FIVE_SCREEN);
            } else if (r.registrationStep == 6) {
              Get.offNamed(AppRoutes.UNDER_VERIFICATION_SCREEN);
            } else if (r.registrationStep > 6 && (r.accountStatus == false)) {
              snackbar(
                  title: "Account Status",
                  message:
                      "Your Account is Deactivate. Please contact Customer Support",
                  type: MsgType.warning);
            } else {
              userData.value = r;
            }
          },
        );
      },
    );
    isLoading(false);
  }

  void getLocation({bool? isOnDuty}) {
    locationLoader(true);
    _notificationPermissionUsecase().then(
      (value) => value.fold(
        (l) {
          if (l is OtherFailure) {
            dutyStatus(!dutyStatus.value);
            snackbar(title: l.code, message: l.message, type: MsgType.warning);
            warningMsg(l.message);
          }
        },
        (r) {
          _locationPermissionUsecase(isOnDuty).then((value) => value.fold(
                (l) {
                  dutyStatus(!dutyStatus.value);
                  if (l is OtherFailure) {
                    warningMsg(l.message);
                    snackbar(
                        title: l.code,
                        message: l.message,
                        type: MsgType.warning);
                  } else if (l is ApiFailure) {
                    snackbar(
                        title: l.code,
                        message: l.message,
                        type: MsgType.warning);
                  }
                },
                (r) {
                  Log.debug(r);
                  warningMsg.value = null;
                  currentAddressName(r);
                  locationLoader(false);
                },
              ));
        },
      ),
    );
  }

  Future<void> onOffDuty(bool? status) async {
    dutyStatus(status ?? false);
    getLocation(isOnDuty: dutyStatus.value);
  }

  void logout() {
    _logoutUsecase().then(
      (value) {
        Get.offAllNamed(AppRoutes.LOGIN_SCREEN);
      },
    );
  }
}
