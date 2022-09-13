import 'package:get/get.dart';
import 'package:riverpod/routes/app_routes.dart';
import 'package:riverpod/screens/home/view.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.HOME_SCREEN,
      page: () =>  HomeView(),
    ),
  ];
}