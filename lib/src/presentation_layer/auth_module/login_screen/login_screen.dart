import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/app_exports.dart';
import '../../../shared/theme/color.dart';

import 'controller/login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height; //834
    var width = MediaQuery.of(context).size.width; //392
    Log.debug("$height  $width");
    return Obx(() {
      return CircularProgress(
        isLoading: controller.isLoading.value,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: ColorfulSafeArea(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 20, left: 20, right: 20, bottom: 10),
                child: ListView(
                  children: [
                    // SvgPicture.asset(
                    //
                    //     "assets/icon/otpVerification.svg"),
                    Lottie.asset('assets/lotifiles/enterPhone.json'),
                    const SizedBox(
                      height: 78,
                    ),
                    Form(
                      key: controller.formKey,
                      child: TextFormField(
                        maxLength: 10,
                        controller: controller.phoneController,
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.phone_android_outlined,
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: "Mobile Number",
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.black, width: 1),
                            // Set the border color when focused
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Number';
                          } else if (value.length <= 9) {
                            return 'Invalid Number';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Text(
                          "An OTP will be sent on given phone number for verification\nStandard message and data rates apply.",
                          style: TextStyle(fontSize: width * 3 / 100),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 58,
                    ),
                    SizedBox(
                      height: 58,
                      width: double.maxFinite,
                      child: ElevatedButton(
                          onPressed: () {
                            if (controller.formKey.currentState!.validate()) {
                              controller.getOtp();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor: primaryColor,
                              elevation: 1,
                              shadowColor: Colors.black),
                          child: const Text(
                            "Get  OTP",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ],
                ),
              )),
        ),
      );
    });
  }
}
