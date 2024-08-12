import 'package:animate_do/animate_do.dart';
import 'package:flutter/services.dart';
import 'package:zonk_rider/src/shared/widgets/selectable_list_dialog.dart';
import '../../../../component/myTextField.dart';
import '../../../../core/app_exports.dart';
import '../../../shared/theme/color.dart';
import 'controller/registration_three_controller.dart';

class RegistrationThreeScreen extends GetView<RegistrationThreeController> {
  const RegistrationThreeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text("Bank Account Details",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      body: GetBuilder<RegistrationThreeController>(builder: (controller) {
        return Obx(
          () => CircularProgress(
            isLoading: controller.isLoading.value,
            child: SingleChildScrollView(
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    LinearProgress(percentLoad: 40),
                    SizedBox(
                      height: deviceHeight * .03,
                    ),
                    FadeInUp(
                      duration: const Duration(milliseconds: 3000),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: TextFormField(
                          onTap: () {
                            SelectableListDialog(context,
                                title: "Select Bank",
                                items: controller.bankList
                                    .map(
                                      (element) => element.name,
                                    )
                                    .toList(),
                                onSelect: controller.onBankSelect);
                          },
                          controller: controller.bankName,
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
                              hintText: "Bank Name",
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: deviceWidth * 3.9 / 100,
                                  color: Colors.black),
                              suffixIcon: const Icon(
                                Icons.arrow_drop_down_sharp,
                                size: 30,
                              ),
                              prefixIcon: const Icon(
                                Icons.account_balance,
                                color: Colors.grey,
                              )),
                          validator: (value) {
                            if (value.toString().isEmpty) {
                              return 'Select Bank';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: deviceHeight * .02,
                    ),
                    FadeInUp(
                      duration: const Duration(milliseconds: 3000),
                      child: MyTextField(
                        maxLength: 20,
                        textInputType: TextInputType.text,
                        hintText: "Enter Branch Name",
                        prefixIcon: const Icon(Icons.account_balance_outlined),
                        controller: controller.branchName,
                        validator: (String? value) {
                          if (value!.isEmpty) return "Enter Branch Name";
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: deviceHeight * .02,
                    ),
                    FadeInUp(
                      duration: const Duration(milliseconds: 3000),
                      child: MyTextField(
                        maxLength: 18,
                        textInputType: TextInputType.number,
                        hintText: "Enter Account Number",
                        prefixIcon: const Icon(Icons.numbers),
                        controller: controller.accountNumber,
                        validator: (String? value) {
                          if (value!.isEmpty) return "Enter Account Number";
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: deviceHeight * .02,
                    ),
                    FadeInUp(
                      duration: const Duration(milliseconds: 3000),
                      child: MyTextField(
                        maxLength: 18,
                        textInputType: TextInputType.number,
                        hintText: "Enter Confirm Account Number",
                        prefixIcon: const Icon(Icons.numbers),
                        controller: controller.confirmAccountNumber,
                        validator: (String? value) {
                          if (value!.isEmpty) return "Enter Account Number";
                          if (value != controller.accountNumber.text) {
                            return "Account Number not matching";
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: deviceHeight * .02,
                    ),
                    FadeInUp(
                      duration: const Duration(milliseconds: 3000),
                      child: MyTextField(
                        maxLength: 15,
                        textInputType: TextInputType.text,
                        hintText: "Enter ifsc code",
                        textCapitalization: TextCapitalization.characters,
                        inputFormatters: [
                          FilteringTextInputFormatter.singleLineFormatter,
                        ],
                        onChanged: (p0) {
                          controller.ifscCode.text = p0.toUpperCase();
                        },
                        prefixIcon:
                            const Icon(Icons.confirmation_number_outlined),
                        controller: controller.ifscCode,
                        validator: (String? value) {
                          if (value!.isEmpty) return "Enter ifsc code";
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: deviceHeight * .03,
                    ),
                    FadeInUp(
                      duration: const Duration(milliseconds: 3000),
                      child: SizedBox(
                        width: deviceWidth - 50,
                        child: ElevatedButton(
                          onPressed: () {
                            if (controller.formKey.currentState!.validate()) {
                              controller.regiStepThreeSet();
                            }
                          },
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
          ),
        );
      }),
    );
  }
}
