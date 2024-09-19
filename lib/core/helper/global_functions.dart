import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trafic_static_app/constants/colors.dart';

void navigateTo(BuildContext context, Widget screen) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
}

void navigateAndReplace(BuildContext context, Widget screen) {
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => screen));
}



showMyDialog(
    {required BuildContext context,
      required Widget content,
      bool isLong = false}) {
  var alert = BackdropFilter(
      filter:
      ImageFilter.blur(sigmaX: 10, sigmaY: 10, tileMode: TileMode.mirror),
      child: Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 15.w),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          backgroundColor: Colors.white,
          child: Container(
              width: ScreenUtil().screenWidth - 30.w,
              height: isLong ? ScreenUtil().screenHeight - 80.h : null,
              child: content)));

  showDialog(
    barrierDismissible: true,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

Color getWhiteRowColor(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused,
  };
  if (states.any(interactiveStates.contains)) {
    return Colors.white;
  }
  return Colors.white;
}

Color getGreyRowColor(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused,
  };
  if (states.any(interactiveStates.contains)) {
    return rowGreyColor;
  }
  return rowGreyColor;
}

Future showLoaderDialog(BuildContext context) async {
  Dialog alert = Dialog(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 15.h,
        ),
        CircularProgressIndicator(
          color: primaryColor,
        ),
        SizedBox(
          height: 15.h,
        ),
      ],
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
