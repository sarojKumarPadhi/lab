import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/gestures.dart';

import '../../../../component/myTextField.dart';
import '../../../../core/app_exports.dart';

import 'controller/registration_one_controller.dart';

class RegistrationOneScreen extends StatelessWidget {
  const RegistrationOneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    var deviceHeight = MediaQuery.of(context).size.height;
    Log.debug("$deviceHeight  $deviceWidth");
    return GetX<RegistrationOneController>(
      initState: (controller) {},
      builder: (controller) {
        return CircularProgress(
          isLoading: controller.isLoading.value,
          child: Scaffold(
            appBar: const CustomAppBar(
              title: "Basic details",
            ),
            body: SingleChildScrollView(
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    LinearProgress(percentLoad: 15),
                    const SizedBox(
                      height: 97.3,
                    ),
                    FadeInUp(
                      duration: const Duration(milliseconds: 2000),
                      child: MyTextField(
                        textInputType: TextInputType.name,
                        controller: controller.labNameController,
                        hintText: 'Enter lab name',
                        prefixIcon: const Icon(
                          Icons.medical_information,
                        ),
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "Enter lab name";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 19.4,
                    ),
                    FadeInUp(
                      duration: const Duration(milliseconds: 2000),
                      child: MyTextField(
                        textInputType: TextInputType.number,
                        hintText: 'Enter lab registration number',
                        prefixIcon: const Icon(Icons.app_registration),
                        controller: controller.regNumberController,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "Enter lab registration number";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 19.4,
                    ),
                    FadeInUp(
                      duration: const Duration(milliseconds: 2000),
                      child: MyTextField(
                        textInputType: TextInputType.name,
                        hintText: 'Enter lab owner name',
                        prefixIcon: const Icon(Icons.person),
                        controller: controller.ownerNameController,
                        validator: (String? value) {
                          if (value!.isEmpty) return "Enter lab owner name";
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 78,
                    ),
                    FadeInUp(
                      duration: const Duration(milliseconds: 3000),
                      child: Row(
                        children: [
                          Obx(() => Checkbox(
                                checkColor: Colors.blue,
                                activeColor: Colors.black,
                                value: controller.isChecked.value,
                                onChanged: controller.updateCheckBox,
                              )),
                          RichText(
                            text: TextSpan(
                              text: 'Accept our terms of services & ',
                              style: const TextStyle(color: Colors.black),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'privacy policy.',
                                  style: const TextStyle(
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = controller.launchURL,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 29.21,
                    ),
                    FadeInUp(
                      duration: const Duration(milliseconds: 2000),
                      child: SizedBox(
                          width: 400,
                          height: 58.41,
                          child: Obx(() => ElevatedButton(
                                onPressed: controller.validation,
                                style: ButtonStyle(
                                    backgroundColor: WidgetStatePropertyAll(
                                        controller.isChecked.value
                                            ? primaryColor
                                            : secondaryColor),
                                    shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    )),
                                child: const Text("Save & Continue",
                                    style: TextStyle(color: Colors.white)),
                              ))),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

void showProminentDisclosure() {
  showDialog(
    context: Get.context!,
    barrierDismissible: false, // Dialog cannot be dismissed by tapping outside
    builder: (context) => PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        print(didPop);
        if (didPop == false) {
          exit(0);
        }
      },
      child: AlertDialog(
        title: const Text('Location Access'),
        content: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'This app collects location data to enable:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('1. To Track the location of rider'),
              Text('2. To calculate distance between rider and lab app'),
              Text(
                  "3. To determine the presence of the rider in the vicinity of the lab's location."),
              SizedBox(height: 8),
              SizedBox(height: 16),
              Text(
                'This location data is collected even when the app is closed or not in use.',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Continue'),
          ),
        ],
      ),
    ),
  );
}
