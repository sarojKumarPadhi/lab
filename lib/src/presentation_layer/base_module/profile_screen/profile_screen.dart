import 'package:google_fonts/google_fonts.dart';
import 'package:zonk_rider/core/app_exports.dart';
import 'package:zonk_rider/src/presentation_layer/base_module/home_screen/controller/home_screen_controller.dart';
import '../../../shared/theme/color.dart';

class ProfileScreen extends GetView<HomeScreenController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text("Your Profile"),
          titleTextStyle: GoogleFonts.acme(color: Colors.white, fontSize: 34),
        ),
        body: Obx(() => SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Account Status",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        controller.userData.value.accountStatus &&
                                controller.userData.value.registrationStep > 6
                            ? const Icon(
                                Icons.verified,
                                color: Colors.green,
                                size: 49,
                              )
                            : controller.userData.value.accountStatus ==
                                        false &&
                                    controller.userData.value.registrationStep >
                                        6
                                ? const Icon(
                                    Icons.block,
                                    color: Colors.red,
                                    size: 49,
                                  )
                                : const Icon(
                                    Icons.pending,
                                    color: Colors.red,
                                    size: 49,
                                  )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Personal Details',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(),
                    _buildDetailRow(
                        'Name', controller.userData.value.name.toString()),
                    _buildDetailRow(
                        'Gender', controller.userData.value.gender.toString()),
                    _buildDetailRow('Phone No',
                        controller.userData.value.phoneNumber.toString()),
                    _buildDetailRow('PAN No', 'ABCDE1234F'),
                    const SizedBox(height: 20.0),
                    const Text(
                      'Residential Details',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(),
                    _buildDetailRow(
                        'District Name', controller.userData.value.district),
                    _buildDetailRow(
                        'State Name', controller.userData.value.state),
                    _buildDetailRow(
                        'City Name', controller.userData.value.city),
                    const SizedBox(height: 20.0),
                    const Text(
                      'Account Details',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(),
                    _buildDetailRow(
                        'Account No', controller.userData.value.accountNumber),
                    _buildDetailRow(
                        'IFSC Code', controller.userData.value.ifscCode),
                    _buildDetailRow(
                        'Bank Name', controller.userData.value.bankName),
                    _buildDetailRow(
                        'Branch Name', controller.userData.value.branchName),
                  ],
                ),
              ),
            )));
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(value),
        ],
      ),
    );
  }
}
