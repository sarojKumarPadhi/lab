import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickalert/quickalert.dart';

import '../theme/color.dart';

void showConfirmationDialog(BuildContext context,
    {String? title,
    String? confirmBtnTxt,
    String? cancleBtnTxt,
    VoidCallback? onConfirmBtnTap}) {
  QuickAlert.show(
      context: context,
      type: QuickAlertType.warning,
      showConfirmBtn: true,
      showCancelBtn: true,
      confirmBtnText: "Yes",
      onCancelBtnTap: () => Get.back(),
      onConfirmBtnTap: onConfirmBtnTap ??
          () {
            Get.back();
          },
      confirmBtnColor: primaryColor);
}
