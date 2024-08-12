import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:zonk_rider/core/app_exports.dart';
import 'package:zonk_rider/src/presentation_layer/base_module/home_screen/controller/home_screen_controller.dart';

import '../../../../shared/widgets/confirmation_dialog.dart';
import '../../../../shared/theme/color.dart';

class HomeDrawer extends GetView<HomeScreenController> {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Obx(
            () => DrawerHeader(
              decoration: const BoxDecoration(
                color: primaryColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          controller.userData.value.name.length > 15
                              ? Text(
                                  "${(controller.userData.value.name).substring(0, 5)}...",
                                  style: GoogleFonts.acme(
                                    color: Colors.white,
                                    //    fontSize: deviceWidth * 0.05,
                                  ),
                                )
                              : Text(
                                  controller.userData.value.name,
                                  style: GoogleFonts.acme(
                                    color: Colors.white,
                                    // fontSize: deviceWidth * 0.05,
                                  ),
                                ),
                          // SizedBox(height: deviceHeight * .008),
                          Text(
                            controller.userData.value.accountStatus &&
                                    controller.userData.value.registrationStep >
                                        6
                                ? "Verified ✅"
                                : controller.userData.value.accountStatus ==
                                            false &&
                                        controller.userData.value
                                                .registrationStep >
                                            6
                                    ? "Account Deactivated 🚫"
                                    : "Not Verified 🚫",
                            style: GoogleFonts.acme(
                              color: Colors.white,
                              // fontSize: deviceWidth * .05
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 135,
                        child: Lottie.asset(
                          'images/lotifiels/delivery-on-scooter.json',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.person,
              color: Colors.blue,
            ),
            title: const Text('Profile'),
            onTap: () {
              Get.toNamed(AppRoutes.PROFILE_SCREEN);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.directions_bike_outlined,
              color: Colors.blue,
            ),
            title: const Text('My Ride'),
            onTap: () {
              //   Get.to(() => const MyRideScreen());
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.payment,
              color: Colors.blue,
            ),
            title: const Text('Payments'),
            onTap: () {
              //  Get.to(() => const EarningsScreen());
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.support_agent_outlined,
              color: Colors.blue,
            ),
            title: const Text('Support'),
            onTap: () {
              //  Get.to(() => const ChatWithSupport());
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            // You can use a different icon here
            title: const Text('Logout'),
            onTap: () {
              showConfirmationDialog(context,
                  title: "Are you sure to want logout?",
                  onConfirmBtnTap: controller.logout);
            },
          ),
        ],
      ),
    );
  }
}
