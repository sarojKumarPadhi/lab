import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../theme/color.dart';

// import '../../../global/globalData.dart';

/// -------------------progress dialog ----------------//

class CircularProgress extends StatelessWidget {
  const CircularProgress({super.key, this.child, this.isLoading = false});
  final Widget? child;
  final bool? isLoading;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child ?? const SizedBox(),
        if (isLoading ?? false)
          const ModalBarrier(
            dismissible: false,
            color: Color.fromRGBO(0, 0, 0, 0.1),
          ),
        if (isLoading ?? false)
          Center(
              child: SpinKitDualRing(
            color: primaryColor, // Choose your desired color
            size: 50.0,
          )),
      ],
    );
  }
}

///---------------------linear progress indicator-------------------

Widget LinearProgress({int percentLoad = 10}) {
  return FadeInUp(
    duration: const Duration(milliseconds: 3000),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
      child: LinearPercentIndicator(
        // width: Get.width - 10,
        animation: true,
        lineHeight: 30.0,
        animationDuration: 2500,
        percent: percentLoad / 100,
        center: Text("$percentLoad  % Completed",
            style: const TextStyle(
                color: Colors.black87, fontWeight: FontWeight.bold)),
        barRadius: const Radius.circular(20),
        progressColor: primaryColor,
      ),
    ),
  );
}
