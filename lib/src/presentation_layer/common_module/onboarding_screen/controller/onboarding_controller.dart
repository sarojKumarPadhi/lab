import '../../../../../core/app_exports.dart';

class OnboardingController extends GetxController {
  final PageController pagecontroller = PageController();
  RxBool onLastPage = false.obs;

  void onclickFinalStep() {
    Get.offNamed(AppRoutes.LOGIN_SCREEN);
  }
}
