import 'package:animate_do/animate_do.dart';
import 'package:flutter/services.dart';
import '../../../../component/myTextField.dart';
import '../../../../core/app_exports.dart';
import '../../../shared/widgets/selectable_list_dialog.dart';
import 'controller/registration_two_controller.dart';

class RegistrationTwoScreen extends GetView<RegistrationTwoController> {
  const RegistrationTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // double deviceWidth = MediaQuery.of(context).size.width;
    // double deviceHeight = MediaQuery.of(context).size.height;
    // Log.debug(deviceWidth);
    // Log.debug(deviceHeight);
    return Obx(
      () => Scaffold(
        appBar: const CustomAppBar(
          title: "Address details",
        ),
        body: CircularProgress(
          isLoading: controller.isLoading.value,
          child: SingleChildScrollView(
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  LinearProgress(percentLoad: 30),
                  const SizedBox(
                    height: 19.475,
                  ),

                  ///--------for country---------------
                  FadeInUp(
                    duration: const Duration(milliseconds: 3000),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                            hintText: "India",
                            hintStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.9,
                                color: Colors.black87),
                            filled: true,
                            suffixIcon: CustomImageView(
                              imagePath: ImageConstant.indiaMap,
                              width: 10,
                            ),
                            fillColor: Colors.grey[300],
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 19.475,
                  ),

                  ///-----------------for state----------------
                  FadeInUp(
                    duration: const Duration(milliseconds: 3000),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: TextFormField(
                        onTap: () {
                          controller.districtController.clear();
                          // controller.formKey.currentState?.validate();
                          controller.stateList.isNotEmpty
                              ? SelectableListDialog(context,
                                  title: "Select State",
                                  items: controller.stateList
                                      .map(
                                        (element) => element.name,
                                      )
                                      .toList(),
                                  onSelect: controller.onSelectState)
                              : null;
                        },
                        controller: controller.stateController,
                        cursorColor: Colors.black,
                        readOnly: true,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[300],
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red)),
                            hintText: "State",
                            hintStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.9,
                                color: Colors.black87),
                            suffixIcon: const Icon(
                              Icons.arrow_drop_down_sharp,
                              size: 30,
                            )),
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return 'Select State';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 18.9,
                  ),

                  ///----------------for district--------------
                  FadeInUp(
                    duration: const Duration(milliseconds: 3000),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: TextFormField(
                        onTap: () {
                          controller.districtController.clear();
                          controller.districtList.isNotEmpty
                              ? SelectableListDialog(context,
                                  title: "Select District",
                                  items: controller.districtList
                                      .map(
                                        (element) => element.name,
                                      )
                                      .toList(),
                                  onSelect: controller.onSelectCity)
                              : null;
                        },
                        controller: controller.districtController,
                        cursorColor: Colors.black87,
                        readOnly: true,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[300],
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red)),
                            hintText: "District",
                            hintStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17.55,
                                color: Colors.black87),
                            suffixIcon: const Icon(
                              Icons.arrow_drop_down_sharp,
                              size: 30,
                            )),
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return 'Select District';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 18.9,
                  ),
                  FadeInUp(
                    duration: const Duration(milliseconds: 3000),
                    child: MyTextField(
                      maxLength: 12,
                      textInputType: TextInputType.text,
                      controller: controller.localityController,
                      hintText: "City / Locality",
                      prefixIcon: const Icon(Icons.location_city),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Enter city or locality name";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 18.9,
                  ),
                  FadeInUp(
                    duration: const Duration(milliseconds: 3000),
                    child: MyTextField(
                      maxLength: 6,
                      textInputType: TextInputType.number,
                      controller: controller.pinCode,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      hintText: "Pin Code",
                      prefixIcon: const Icon(Icons.pin),
                      validator: (String? value) {
                        if (value!.isEmpty) return "Enter a valid pin";
                        if (value.length < 6) return "Enter a valid pin";
                        if (value.length > 6) return "Enter a valid pin";
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 48.65,
                  ),
                  FadeInUp(
                    duration: const Duration(milliseconds: 3000),
                    child: SizedBox(
                      width: 400,
                      child: ElevatedButton(
                        onPressed: () {
                          if (controller.formKey.currentState!.validate()) {
                            controller.regTwoSet();
                          }
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(buttonColor),
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
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
        ),
      ),
    );
  }
}
