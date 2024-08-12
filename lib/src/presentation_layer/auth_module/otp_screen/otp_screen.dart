import 'package:animate_do/animate_do.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

import '../../../../core/app_exports.dart';
import '../../../shared/theme/color.dart';

import 'controller/otp_controller.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<OTPController>(
      initState: (controller) {},
      builder: (controller) {
        return CircularProgress(
            isLoading: controller.isLoading.value,
            child: Scaffold(
                body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: Column(
                    children: [
                      CustomImageView(
                        imagePath: 'assets/gif/verifyOtp4.gif',
                        height: 200,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text(
                          "Enter verification code",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 27,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 19.5),
                        child: Text(
                          "We have send you a 6 digit code on",
                          style: TextStyle(
                            color: Color(0xFF757575),
                            fontSize: 15.75,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 93,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "+91 ${controller.data.mobileNo}",
                            style: const TextStyle(
                                color: Color(0xFF505050),
                                fontSize: 15.75,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: CustomImageView(
                                imagePath: ImageConstant.edit,
                                width: 25,
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 46.74,
                      ),
                      Form(
                        key: controller.formKey,
                        child: FadeInUp(
                          duration: const Duration(milliseconds: 3000),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 12.15, left: 12.15),
                            child: OTPTextField(
                              outlineBorderRadius: 10,
                              controller: controller.otpBoxController,
                              length: 6,
                              width: MediaQuery.of(context).size.width,
                              fieldWidth: 50,
                              style: const TextStyle(fontSize: 17),
                              textFieldAlignment: MainAxisAlignment.spaceAround,
                              fieldStyle: FieldStyle.box,
                              onChanged: (value) {
                                if (value.length == 6) {
                                  controller.otp.value = value;
                                }
                              },
                              onCompleted: (pin) {
                                if (pin.length == 6) {
                                  controller.otp.value = pin;
                                  controller.verifyOtp();
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {
                                //  sendOtp(context);
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                        backgroundColor: Colors.black,
                                        content: Text(
                                          "sending",
                                          style: TextStyle(color: Colors.white),
                                        )));
                              },
                              child: const Text(
                                "Resend otp",
                                style: TextStyle(
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 175.275,
                      ),
                      SizedBox(
                        height: 59.39,
                        width: 396,
                        child: ElevatedButton(
                            onPressed: () {
                              if (controller.formKey.currentState!.validate()) {
                                controller.verifyOtp();
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
                              "Verify OTP",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            )));
      },
    );
  }
}
