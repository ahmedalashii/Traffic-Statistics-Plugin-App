import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? title;
  final Color? color;
  final double? fontSize;
  const PrimaryButton(
      {Key? key, this.onPressed, this.title, this.color, this.fontSize = 16})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        title!,
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
              fontSize: fontSize!.sp,
              color: Colors.white,
              fontWeight: FontWeight.w600),
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        elevation: 0,
      ),
    );
  }
}
