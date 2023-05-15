import 'package:get/get.dart';
import 'package:live_tv/config/app_routes.dart';
import 'package:live_tv/screen/category_screen.dart';
import 'package:live_tv/screen/channel_screen.dart';
import 'package:live_tv/screen/home_screen.dart';
import 'package:live_tv/screen/language_screen.dart';
import 'package:live_tv/screen/splash_screen.dart';
import 'package:live_tv/screen/view_schedual_view.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.splashScreen,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: AppRoutes.homeScreen,
      page: () => const HomePageScreen(),
    ),
    GetPage(
      name: AppRoutes.categoryScreen,
      page: () => const CategoryScreen(),
    ),
    GetPage(
      name: AppRoutes.languageScreen,
      page: () => const LanguageScreen(),
    ),
    GetPage(
      name: AppRoutes.channelScreen,
      page: () => const ChannelScreen(),
    ),
    GetPage(
      name: AppRoutes.schedualScreen,
      page: () => const SchedualView(),
    ),
  ];
}
