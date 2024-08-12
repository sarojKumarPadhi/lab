import 'package:animate_do/animate_do.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import '../../../../core/app_exports.dart';
import 'controller/splash_screen_controller.dart';

class SplashScreen extends GetView<SplashScreenController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ColorfulSafeArea(
          color: Colors.white,
          child: Center(
              child: FadeInDown(
            child: CustomImageView(imagePath: ImageConstant.logo, width: 200),
          )),
        ));
  }
}
