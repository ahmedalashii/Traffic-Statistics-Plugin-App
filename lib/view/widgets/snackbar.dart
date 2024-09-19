import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';

showMySnackBar(String title,String message){
  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: primaryColor,
    borderRadius: 20,
    margin:const  EdgeInsets.all(15),
    colorText: Colors.white,
    duration: const Duration(seconds: 4),
    isDismissible: true,
    dismissDirection: DismissDirection.vertical,
    forwardAnimationCurve: Curves.easeOutBack,
  );
}

