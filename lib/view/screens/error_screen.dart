import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trafic_static_app/constants/colors.dart';
import 'package:trafic_static_app/core/helper/global_functions.dart';
import 'package:trafic_static_app/view/screens/choose_website_screen.dart';
import 'package:trafic_static_app/view/widgets/primary_button.dart';
import 'package:trafic_static_app/view/widgets/primary_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/error.png',height: 150.h,width: 150.w,),
            SizedBox(
              height: 20.h,
            ),
            PrimaryText(
              'Something Wrong!',
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: 7.h,
            ),
            PrimaryText(
              'make sure Visitor Traffics plugin is active',
              fontSize: 14,
            ),
            SizedBox(
              height:20.h,
            ),
            PrimaryButton(
              title: 'Choose Website',
              onPressed: (){
                Get.deleteAll(force: true);

                navigateAndReplace(context, ChooseWebsiteScreen());
              },
              color: primaryColor,
              fontSize: 13,
            )
          ],
        ),
      ),
    );
  }
}
