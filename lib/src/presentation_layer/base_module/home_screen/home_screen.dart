import 'package:shimmer/shimmer.dart';
import 'package:zonk_rider/core/app_exports.dart';

import '../../../shared/theme/color.dart';
import 'controller/home_screen_controller.dart';
import 'widgets/drawer.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    var deviceHeight = MediaQuery.of(context).size.height;
    Log.debug("$deviceHeight $deviceWidth");
    Log.debug(controller.warningMsg.value);
    return Obx(() => Scaffold(
          drawer: const HomeDrawer(),
          appBar: AppBar(
            backgroundColor: primaryColor,
            iconTheme: const IconThemeData(color: Colors.white),
            titleTextStyle: const TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            title: Text(controller.userData.value.name),
            actions: [
              // Switch widget in the app bar
              Switch(
                  activeColor: Colors.green,
                  inactiveThumbColor: Colors.red,
                  activeTrackColor: Colors.white,
                  value: controller.dutyStatus.value,
                  onChanged: controller.onOffDuty)
            ],
          ),
          body: CircularProgress(
            isLoading: controller.isLoading.value,
            child: Stack(
              children: [
                Opacity(
                    opacity: 1,
                    child: CustomImageView(
                      imagePath: ImageConstant.backgroundHome,
                      fit: BoxFit.cover,
                      width: double.maxFinite,
                      height: double.maxFinite,
                    )),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 20),
                      child: Row(
                        children: [
                          Text(
                            "Hello, Mr. ${controller.userData.value.name} ",
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Colors.blue,
                          ),
                          controller.currentAddressName.value != null &&
                                  controller.locationLoader.value == false
                              ? Text(controller.currentAddressName.toString())
                              : SizedBox(
                                  width: deviceWidth * .5,
                                  height: deviceHeight * .04,
                                  child: Shimmer.fromColors(
                                    baseColor: Colors.black.withOpacity(.5),
                                    highlightColor: Colors.grey[300]!,
                                    child: Container(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => const PolyLineScreen(),));
                          },
                          child: Padding(
                              padding: const EdgeInsets.only(top: 30, left: 30),
                              child: Container(
                                width: deviceWidth * 0.510,
                                height: deviceHeight * 0.143,
                                padding:
                                    const EdgeInsets.only(left: 15, bottom: 10),
                                decoration: BoxDecoration(
                                  color: Colors.black87,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    const Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      // Align content to the bottom
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Track",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22,
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        // Add some vertical spacing
                                        Padding(
                                          padding: EdgeInsets.only(left: 5),
                                          child: Text(
                                            "Ride",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 22,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: CustomImageView(
                                        imagePath: ImageConstant.route,
                                      ),
                                    )
                                  ],
                                ),
                              )),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Obx(
                      () => controller.warningMsg.value == null
                          ? const SizedBox()
                          : Container(
                              width: double.maxFinite,
                              color: Colors.red,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              child: Text(
                                controller.warningMsg.value.toString(),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
