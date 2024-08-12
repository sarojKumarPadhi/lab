import 'package:otp_text_field/otp_field.dart';

import '../../../../../core/app_exports.dart';
import '../../../../domain_layer/entities/authentication_entities/login_entities.dart';
import '../../../../domain_layer/usecases/authentication_usecase/verify_otp_usecase.dart';

class OTPController extends GetxController {
  OTPController(this._otpUseCase);
  final VerifyOtpUseCase _otpUseCase;
  final formKey = GlobalKey<FormState>();
  final OtpFieldController otpBoxController = OtpFieldController();
  RxString otp = ''.obs;
  RxBool isLoading = false.obs;
  final data = Get.arguments as LoginEntities;
  void verifyOtp() async {
    if (otp.value.length == 6) {
      isLoading(true);
      await _otpUseCase(VerifyOtpParams(
              verificationId: data.verificationId,
              mobileNo: data.mobileNo,
              otp: otp.value))
          .then(
        (value) {
          value.fold(
            (l) {
              snackbar(
                  title: l.code, message: l.message, type: MsgType.failure);
            },
            (value) {
              final r = value.data;
              if (value.msgType == MsgType.success) {
                if (r?.registrationStep == 1) {
                  Get.offNamed(AppRoutes.REG_STEP_ONE_SCREEN);
                } else if (r?.registrationStep == 2) {
                  Get.offNamed(AppRoutes.REG_STEP_TWO_SCREEN);
                } else if (r?.registrationStep == 3) {
                  Get.offNamed(AppRoutes.REG_STEP_THREE_SCREEN);
                } else if (r?.registrationStep == 4) {
                  Get.offNamed(AppRoutes.REG_STEP_FOUR_SCREEN);
                } else if (r?.registrationStep == 5) {
                  Get.offNamed(AppRoutes.REG_STEP_FIVE_SCREEN);
                } else if (r?.registrationStep == 6) {
                  Get.offNamed(AppRoutes.UNDER_VERIFICATION_SCREEN);
                } else if ((r?.registrationStep ?? 0) > 6 &&
                    (r?.accountStatus ?? false)) {
                  Get.offNamed(AppRoutes.HOME_SCREEN);
                } else {
                  Get.offNamed(AppRoutes.LOGIN_SCREEN);
                }
              } else {
                snackbar(
                    title: "${value.msgType}",
                    message: value.msg ?? "",
                    type: value.msgType);
              }
            },
          );
        },
      );
      isLoading(false);
    } else {}
    // getOtp() async {
    //   isLoading(true);
    //   await _loginUserUseCase(LoginUserParams(phoneController.text)).then(
    //     (value) {
    //       value.fold(
    //         (l) {
    //           snackbar(title: l.code, message: l.message, type: MsgType.failure);
    //         },
    //         (r) {
    //           Get.toNamed(AppRoutes.LOGIN_SCREEN);
    //         },
    //       );
    //     },
    //   );
    //   isLoading(false);
    // }
  }
}
