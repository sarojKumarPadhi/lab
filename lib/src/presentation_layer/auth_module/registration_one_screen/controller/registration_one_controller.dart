import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/app_exports.dart';
import '../../../../domain_layer/usecases/authentication_usecase/registration_one_usecase.dart';
import '../registration_one_screen.dart';

class RegistrationOneController extends GetxController {
  RegistrationOneController(this._registrationOneUsecase);
  final RegistrationOneUsecase _registrationOneUsecase;
  final formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController ownerNameController = TextEditingController();
  TextEditingController labNameController = TextEditingController();
  TextEditingController regNumberController = TextEditingController();

  RxBool isLoading = false.obs;
  RxBool isChecked = false.obs;
  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        showProminentDisclosure();
      },
    );
    super.onInit();
  }

  launchURL() async {
    final Uri url = Uri.parse(
        'https://sites.google.com/view/jonkk-terms-and-conditions/home');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  void updateCheckBox(bool? ischeck) {
    isChecked.value = ischeck ?? false;
  }

  void validation() {
    if (formKey.currentState!.validate()) {
      if (isChecked.value) {
        regOneSet();
      } else {
        snackbar(
            title: "Wanring",
            message: "Please Accept Terms & Conditions",
            type: MsgType.warning);
      }
    }
  }

  Future<void> regOneSet() async {
    isLoading(true);
    await _registrationOneUsecase
        .call(RegistrationOneParams(
            labName: labNameController.text,
            labOwnerName: ownerNameController.text,
            regiNumber: regNumberController.text))
        .then(
      (value) {
        value.fold(
          (l) => snackbar(
              title: l.message, message: l.message, type: MsgType.failure),
          (r) {
            Get.offNamed(AppRoutes.REG_STEP_TWO_SCREEN);
          },
        );
      },
    );
    isLoading(false);
  }
}
