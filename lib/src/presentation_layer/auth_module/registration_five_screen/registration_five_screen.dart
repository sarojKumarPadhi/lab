import 'package:animate_do/animate_do.dart';

import '../../../../core/app_exports.dart';
import '../../../shared/theme/color.dart';
import '../../../shared/widgets/custom_upload_image_widget.dart';
import 'controller/registration_five_controller.dart';

class RegistrationFiveScreen extends GetView<RegistrationFiveController> {
  const RegistrationFiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Obx(
      () {
        return CircularProgress(
          isLoading: controller.isLoading.value,
          child: Scaffold(
            appBar: AppBar(
              iconTheme: const IconThemeData(color: Colors.white),
              title: const Text("Sample Collecter image",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              backgroundColor: primaryColor,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  LinearProgress(percentLoad: 80),
                  SizedBox(
                    height: deviceHeight * .03,
                  ),
                  FadeInUp(
                    duration: const Duration(milliseconds: 3000),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Spacer(),
                        const Text("Selfie 1 *",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: UploadImage(
                            file: controller.selfie1ImageFile.value,
                            onTap: controller.onTapSelfie1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: deviceHeight * .02,
                  ),
                  FadeInUp(
                    duration: const Duration(milliseconds: 3000),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Spacer(),
                        const Text("Selfie 2*",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: UploadImage(
                            file: controller.selfie2ImageFile.value,
                            onTap: controller.onTapSelfie2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: deviceHeight * .02,
                  ),
                  FadeInUp(
                    duration: const Duration(milliseconds: 3000),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Spacer(),
                        const Text("Bike Front Image*",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: UploadImage(
                            file: controller.bikeFrontImageFile.value,
                            onTap: controller.onTapBikeFront,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: deviceHeight * .02,
                  ),
                  FadeInUp(
                    duration: const Duration(milliseconds: 3000),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Spacer(),
                        const Text("Bike Back Image*",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: UploadImage(
                            file: controller.bikeBackImageFile.value,
                            onTap: controller.onTapBikeBack,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: deviceHeight * .05,
                  ),
                  FadeInUp(
                    duration: const Duration(milliseconds: 3000),
                    child: SizedBox(
                      width: deviceWidth - 50,
                      child: ElevatedButton(
                        onPressed: controller.regiFiveset,
                        style: ButtonStyle(
                            shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                              side: const BorderSide(color: Colors.grey)),
                        )),
                        child: const Text("Save & Continue",
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
