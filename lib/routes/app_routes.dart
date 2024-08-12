// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'package:jonk_lab/src/presentation_layer/auth_module/login_screen/binding/login_binding.dart';
import 'package:jonk_lab/src/presentation_layer/auth_module/login_screen/login_screen.dart';
import 'package:jonk_lab/src/presentation_layer/auth_module/otp_screen/binding/otp_binding.dart';
import 'package:jonk_lab/src/presentation_layer/auth_module/otp_screen/otp_screen.dart';
import 'package:jonk_lab/src/presentation_layer/common_module/onboarding_screen/binding/onboarding_binding.dart';
import '../core/app_exports.dart';
import '../src/presentation_layer/auth_module/registration_one_screen/binding/registration_one_binding.dart';
import '../src/presentation_layer/auth_module/registration_one_screen/registration_one_screen.dart';
import '../src/presentation_layer/auth_module/registration_two_screen/binding/registration_two_binding.dart';
import '../src/presentation_layer/auth_module/registration_two_screen/registration_two_screen.dart';
import '../src/presentation_layer/common_module/onboarding_screen/onboarding_screen.dart';
import '../src/presentation_layer/common_module/splash_screen/binding/splash_binding.dart';
import '../src/presentation_layer/common_module/splash_screen/splash_screen.dart';

class AppRoutes {
  static const String INITIAL_ROUTE = '/';
  static const String ONBOARDING_SCREEN = '/onboarding';
  static const String LOGIN_SCREEN = '/login';
  static const String OTP_SCREEN = '/otp';
  static const String REG_STEP_ONE_SCREEN = '/registrationStepOne';
  static const String REG_STEP_TWO_SCREEN = '/registrationStepTwo';
  static const String REG_STEP_THREE_SCREEN = '/registrationStepThree';
  static const String REG_STEP_FOUR_SCREEN = '/registrationStepFour';
  static const String REG_STEP_FIVE_SCREEN = '/registrationStepFive';
  static const String UNDER_VERIFICATION_SCREEN = '/underVerificationScreen';
  static const String HOME_SCREEN = '/homeScreen';
  static const String PROFILE_SCREEN = '/profileScreen';

  static List<GetPage> pages = [
    GetPage(
        name: INITIAL_ROUTE,
        page: () => const SplashScreen(),
        binding: SplashBinding()),
    GetPage(
        name: ONBOARDING_SCREEN,
        page: () => const OnboardingScreen(),
        binding: OnboardingBinding()),
    GetPage(
        name: LOGIN_SCREEN,
        page: () => const LoginScreen(),
        binding: LoginBinding()),
    GetPage(
        name: OTP_SCREEN, page: () => const OTPScreen(), binding: OTPBinding()),
    GetPage(
        name: OTP_SCREEN, page: () => const OTPScreen(), binding: OTPBinding()),
    GetPage(
      name: REG_STEP_ONE_SCREEN,
      page: () => const RegistrationOneScreen(),
      transition: Transition.leftToRight,
      transitionDuration: const Duration(milliseconds: 300),
      binding: RegistrationOneBinding(),
    ),
    GetPage(
      name: REG_STEP_TWO_SCREEN,
      page: () => const RegistrationTwoScreen(),
      transition: Transition.leftToRight,
      transitionDuration: const Duration(milliseconds: 300),
      binding: RegistrationTwoBinding(),
    ),
    // GetPage(
    //   name: REG_STEP_THREE_SCREEN,
    //   page: () => const RegistrationThreeScreen(),
    //   transition: Transition.leftToRight,
    //   transitionDuration: const Duration(milliseconds: 300),
    //   binding: RegistrationThreeBinding(),
    // ),
    // GetPage(
    //   name: REG_STEP_FOUR_SCREEN,
    //   page: () => const RegistrationFourScreen(),
    //   transition: Transition.leftToRight,
    //   transitionDuration: const Duration(milliseconds: 300),
    //   binding: RegistrationFourBinding(),
    // ),
    // GetPage(
    //   name: REG_STEP_FIVE_SCREEN,
    //   page: () => const RegistrationFiveScreen(),
    //   transition: Transition.leftToRight,
    //   transitionDuration: const Duration(milliseconds: 300),
    //   binding: RegistrationFiveBinding(),
    // ),
    // GetPage(
    //   name: UNDER_VERIFICATION_SCREEN,
    //   page: () => const UnderVerificationScreen(),
    //   transition: Transition.leftToRight,
    //   transitionDuration: const Duration(milliseconds: 300),
    //   binding: UnderVerificationBinding(),
    // ),
    // GetPage(
    //   name: HOME_SCREEN,
    //   page: () => const HomeScreen(),
    //   transition: Transition.leftToRight,
    //   transitionDuration: const Duration(milliseconds: 300),
    //   binding: HomeBinding(),
    // ),
    // GetPage(
    //   name: PROFILE_SCREEN,
    //   page: () => const ProfileScreen(),
    //   transition: Transition.leftToRight,
    //   transitionDuration: const Duration(milliseconds: 300),
    //   binding: ProfileBinding(),
    // ),
  ];
}
