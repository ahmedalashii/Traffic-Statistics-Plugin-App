import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:trafic_static_app/view/screens/choose_website_screen.dart';
import 'core/cache_controller.dart';
import 'core/helper/binding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CacheController.instance.init();

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => GetMaterialApp(
        initialBinding: Binding(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            appBarTheme: AppBarTheme(
                color: Theme.of(context).scaffoldBackgroundColor,
                centerTitle: true,
                elevation: 0)),
        home: const ChooseWebsiteScreen(),
      ),
    );
  }
}
