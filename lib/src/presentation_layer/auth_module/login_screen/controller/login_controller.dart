import '../../../../../core/app_exports.dart';
import '../../../../domain_layer/entities/authentication_entities/login_entities.dart';
import '../../../../domain_layer/usecases/authentication_usecase/login_uscase.dart';

class LoginController extends GetxController {
  LoginController(this._loginUserUseCase);
  final LoginUserUseCase _loginUserUseCase;
  final formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  RxBool isLoading = false.obs;

  getOtp() async {
    isLoading(true);
    await _loginUserUseCase(LoginUserParams(phoneController.text)).then(
      (value) {
        value.fold(
          (l) {
            snackbar(title: l.code, message: l.message, type: MsgType.failure);
          },
          (r) {
            Get.toNamed(AppRoutes.OTP_SCREEN,
                arguments: LoginEntities(
                    verificationId: r.verificationId,
                    resendToken: r.resendToken,
                    mobileNo: phoneController.text));
            snackbar(
              title: "OTP Sent",
              message: "We have sent otp on device",
            );
          },
        );
      },
    );
    isLoading(false);
  }
}
