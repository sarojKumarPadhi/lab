import 'package:animate_do/animate_do.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/app_exports.dart';
import '../../../shared/theme/color.dart';
import 'controller/onboarding_controller.dart';

class OnboardingScreen extends GetView<OnboardingController> {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height; //834
    var width = MediaQuery.of(context).size.width; //392

    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            PageView(
              controller: controller.pagecontroller,
              onPageChanged: (index) {
                controller.onLastPage.value = (index == 2);
              },
              children: [
                Container(
                  color: firstIntroBackgroundColor,
                  child: AnimatedSwitcher(
                    duration: const Duration(microseconds: 400),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          SizedBox(
                            height: height * .1,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(width * .01),
                            child: Image.asset(
                              "assets/images/introFirst.jpg",
                              width: width * .8,
                            ),
                          ),
                          SizedBox(
                            height: height * .15,
                          ),
                          Container(
                            alignment: Alignment.center, // Center alignment
                            child: Center(
                              child: Text(
                                "Providing \nHome Sample \nCollections",
                                textAlign: TextAlign.center,
                                // Center align the text horizontally
                                style: TextStyle(
                                    fontSize: width * .07,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                        Colors.white70,
                        secondIntroBackgroundColor
                      ])),
                  child: AnimatedSwitcher(
                    duration: const Duration(microseconds: 400),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          SizedBox(
                            height: height * .1,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(width * .01),
                            child: Image.asset(
                              fit: BoxFit.fill,
                              "assets/images/introSecond.jpg",
                              width: width * .8,
                              height: height * .3,
                            ),
                          ),
                          SizedBox(
                            height: height * .15,
                          ),
                          Container(
                            alignment: Alignment.center, // Center alignment
                            child: Center(
                              child: Text(
                                "Easy Booking &\n Economical",
                                textAlign: TextAlign.center,
                                // Center align the text horizontally
                                style: TextStyle(
                                    fontSize: width * 5.7 / 100,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                FadeInDown(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        SizedBox(
                          height: height * .1,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(width * .01),
                          child: Image.asset(
                            "assets/images/introThird.jpg",
                            width: width * .8,
                          ),
                        ),
                        SizedBox(
                          height: height * .15,
                        ),
                        Container(
                          alignment: Alignment.center, // Center alignment
                          child: Center(
                            child: Text(
                              "Home Sample Collections  \n Verified & Trained \n PHLEBOTOMISTS",
                              textAlign: TextAlign.center,
                              // Center align the text horizontally
                              style: TextStyle(
                                  fontSize: width * 5.7 / 100,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            FadeInDown(
              child: Container(
                  alignment: const Alignment(0, 0.75),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SmoothPageIndicator(
                        controller: controller.pagecontroller,
                        count: 3,
                      ),
                      SizedBox(
                        height: height * 3.6 / 100,
                      ),
                      GestureDetector(
                          onTap: () {
                            controller.pagecontroller.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeIn);
                          },
                          child: controller.onLastPage.value
                              ? SizedBox(
                                  height: height * 6 / 100,
                                  width: width * 38.3 / 100,
                                  child: ElevatedButton(
                                      onPressed: controller.onclickFinalStep,
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          backgroundColor: primaryColor,
                                          elevation: 1,
                                          shadowColor: Colors.black),
                                      child: const Text(
                                        "Get Started",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      )),
                                )
                              : SizedBox(
                                  height: height * 6 / 100,
                                  width: width * 38.3 / 100,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        controller.pagecontroller.nextPage(
                                            duration: const Duration(
                                                milliseconds: 500),
                                            curve: Curves.easeIn);
                                      },
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          backgroundColor: primaryColor,
                                          elevation: 1,
                                          shadowColor: Colors.black),
                                      child: const Text(
                                        "Next",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      )),
                                )),
                      SizedBox(
                        height: height * 9.6 / 100,
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
