import 'package:animate_do/animate_do.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';

import '../../../../core/app_exports.dart';
import '../../../shared/theme/color.dart';

import 'controller/under_verification_controller.dart';

class UnderVerificationScreen extends StatelessWidget {
  const UnderVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<UnderVerificationController>(
      // init: LoginController(loginUserUseCase:   LoginUserUseCase(

      // )),
      initState: (controller) {},
      builder: (controller) {
        return CircularProgress(
          isLoading: controller.isLoading.value,
          child: Scaffold(
            backgroundColor: whiteColor,
            body: ColorfulSafeArea(
              color: Colors.black,
              child: Center(
                child: SingleChildScrollView(
                  child: RefreshIndicator(
                    onRefresh: () => Future.delayed(const Duration(seconds: 2)),
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        children: [
                          // Image.asset("images/phone.jpg", width: deviceWidth * 0.55),
                          FadeInUp(
                              duration: const Duration(milliseconds: 2000),
                              child: CustomImageView(
                                svgPath: ImageConstant.hourGlasSvg,
                                color: primaryColor,
                                height: 150,
                                // width: deviceWidth * 0.55,
                                width: 247,
                              )),
                          const SizedBox(
                            height: 38,
                          ),
                          FadeInUp(
                            duration: const Duration(milliseconds: 2000),
                            child: const Text("Under Verification !",
                                style: TextStyle(
                                  fontSize: 27.27,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          const SizedBox(
                            height: 25.31,
                          ),
                          FadeInUp(
                            duration: const Duration(milliseconds: 2000),
                            child: const Text(
                                "Your account is under verification.\n It may take some time to approving.",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 14.18)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
