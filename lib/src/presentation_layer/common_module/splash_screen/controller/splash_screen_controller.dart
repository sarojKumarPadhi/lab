import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../core/app_exports.dart';
import '../../../../domain_layer/usecases/common_usecase/splash_usecase.dart';

class SplashScreenController extends GetxController {
  SplashScreenController(this._splashUsecase);
  final SplashUsecase _splashUsecase;

  @override
  void onInit() {
    startTimer();
    super.onInit();
  }
  // bool getAuth() {
  //   if (data.read("auth") != null) {
  //     debugPrint(
  //         "this is my authentication token:----------------------- ${data.read("auth")}");
  //     return true;
  //   }
  //   return false;
  // }

  startTimer() {
    Timer(
      const Duration(seconds: 2),
      () async {
        if (FirebaseAuth.instance.currentUser?.uid != null) {
          _splashUsecase().then(
            (value) {
              value.fold(
                (l) => Get.offNamed(AppRoutes.LOGIN_SCREEN),
                (r) {
                  Log.info(r.registrationStep);
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
                  } else if ((r.registrationStep ?? 0) > 6 &&
                      (r.accountStatus ?? false)) {
                    Get.offNamed(AppRoutes.HOME_SCREEN);
                  } else {
                    Get.offNamed(AppRoutes.LOGIN_SCREEN);
                  }
                },
              );
            },
          );
        } else {
          Get.offNamed(AppRoutes.ONBOARDING_SCREEN);
        }
      },
    );
  }
}
