import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trafic_static_app/constants/colors.dart';
import 'package:trafic_static_app/core/cache_controller.dart';
import 'package:trafic_static_app/view/screens/choose_website_screen.dart';
import 'package:trafic_static_app/view/widgets/primary_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState()  {
    super.initState();
    CacheController.instance.init();

    Future.delayed(const Duration(seconds: 3), () {}).then((value) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const ChooseWebsiteScreen();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned(
          child: Image.asset('images/splash_left.png',height: 220.h,),
          bottom: 0,
          left: 0,
        ),
        Positioned(
          child: Image.asset('images/splash_right.png',height: 180.h,),
          top: 0,
          right: 0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'images/splash_img.png',
                height: 195.h,
                width: 195.w,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            const PrimaryText(
              'Traffic Statistics App',
              color: primaryColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ]),
    );
  }
}
