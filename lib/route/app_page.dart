// routes/app_pages.dart
import 'package:future_hub/feature/controller/create_controller.dart';
import 'package:future_hub/feature/controller/login_controller.dart';
import 'package:future_hub/feature/controller/splash_controller.dart';
import 'package:future_hub/feature/page/create/createStep.dart';
import 'package:future_hub/feature/page/home_page.dart';
import 'package:future_hub/feature/page/login.dart';
import 'package:future_hub/feature/page/validifation_phone%20page.dart';
import 'package:future_hub/feature/splash.dart';
import 'package:future_hub/route/app_route.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.splash, page: () => const SplashPage(),
     binding: BindingsBuilder(() {
        Get.lazyPut<SplashController>(() => SplashController());
      }),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      binding: BindingsBuilder(() {
        Get.lazyPut<LoginController>(() => LoginController());
      }),
    ),
   GetPage(
      name: AppRoutes.homePage,
      page: () => const HomePage(),
      binding: BindingsBuilder(() {
       // Get.lazyPut<LoginController>(() => LoginController());
      }),
    ),
GetPage(
      name: AppRoutes.createAccountStep1Page,
      page: () =>  CreateAccountStep1Page(),
      binding: BindingsBuilder(() {
        Get.lazyPut<CreateAccountController>(() => CreateAccountController());
      }),
    ),
GetPage(
      name: AppRoutes.verifyPhonePage,
      page: () => const VerifyPhonePage(),
      binding: BindingsBuilder(() {
       // Get.lazyPut<CreateAccountController>(() => CreateAccountController());
      }),
    ),
    
  ];
}
