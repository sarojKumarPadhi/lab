import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jonk_lab/global/globalData.dart';
import 'package:jonk_lab/global/progressIndicator.dart';
import 'package:lottie/lottie.dart';

import '../auth/sendOtp.dart';
import '../global/color.dart';

class MobileNumber extends StatefulWidget {
  const MobileNumber({super.key});

  @override
  State<MobileNumber> createState() => _MobileNumberState();
}

class _MobileNumberState extends State<MobileNumber> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height; //834
    var width = MediaQuery.of(context).size.width; //392
    return Scaffold(
      backgroundColor: Colors.white,
      body: ColorfulSafeArea(
          color: Colors.white,
          child: Padding(
            padding:
                const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
            child: ListView(
              children: [
                // SvgPicture.asset(
                //
                //     "assets/icon/otpVerification.svg"),
                Lottie.asset('assets/lotifiles/enterPhone.json'),
                SizedBox(
                  height: height * 8 / 100,
                ),
                Form(
                  key: _formKey,
                  child: TextFormField(
                    maxLength: 10,
                    controller: numberController,
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
                SizedBox(
                  height: height * 2.5 / 100,
                ),
                Row(
                  children: [
                    Text(
                      "An OTP will be sent on given phone number for verification\nStandard message and data rates apply.",
                      style: TextStyle(fontSize: width * 3 / 100),
                    )
                  ],
                ),
                SizedBox(
                  height: height * 6 / 100,
                ),
                SizedBox(
                  height: height * 6.1 / 100,
                  width: width * 88 / 100,
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) {
                              return const CircularProgress();
                            },
                          );
                          phoneNumber = numberController.text;
                          sendOtp(context);
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
    );
  }
}
