import '../modules/splash/splash_binding.dart';
import '../modules/splash/splash_view.dart';
import 'package:get/get.dart';

import '../modules/home/home_binding.dart';
import '../modules/home/home_view.dart';

import 'app_routes.dart';

class AppPages {
  static var PAGES = [
    //* SPLASH
    GetPage(
      name: AppRoutes.splash.path,
      page: () => const SplashView(),
      binding: SplashBinding(),
      transition: Transition.noTransition,
    ),

    //* Home
    GetPage(
      name: AppRoutes.home.path,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
