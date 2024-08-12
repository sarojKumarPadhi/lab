import 'package:animate_do/animate_do.dart';

import '../../../../core/app_exports.dart';
import '../../../shared/theme/color.dart';
import '../../../shared/widgets/custom_upload_image_widget.dart';
import 'controller/registration_four_controller.dart';

class RegistrationFourScreen extends GetView<RegistrationFourController> {
  const RegistrationFourScreen({super.key});

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
              title: const Text("Document Upload",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              backgroundColor: primaryColor,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  LinearProgress(percentLoad: 60),
                  SizedBox(
                    height: deviceHeight * .03,
                  ),
                  FadeInUp(
                    duration: const Duration(milliseconds: 3000),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Spacer(),
                        const Text("Aadhar Card *",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: UploadImage(
                            file: controller.aadharImageFile.value,
                            onTap: controller.onTapAadhar,
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
                        const Text("     Pan Card *",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: UploadImage(
                            file: controller.panImageFile.value,
                            onTap: controller.onTapPan,
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
                        const Text("Bank Passbook *",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: UploadImage(
                            file: controller.bankPassBookImageFile.value,
                            onTap: controller.onTapBanPassbook,
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
                        const Text("Education Certificate *",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: UploadImage(
                            file: controller.educationImageFile.value,
                            onTap: controller.onTapEduction,
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
                        onPressed: controller.regiFourset,
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
