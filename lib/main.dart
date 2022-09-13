import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:riverpod/routes/app_pages.dart';
import 'package:riverpod/routes/app_routes.dart';
import 'package:riverpod/view_model_binding/view_model_binding.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter GetX',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding: ViewModelBinding(),
      initialRoute: AppRoutes.HOME_SCREEN,
      getPages: AppPages.list,
    );
  }
}

