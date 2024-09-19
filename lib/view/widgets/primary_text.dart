import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimaryText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final TextOverflow overflow;
  final int maxLines;

  const PrimaryText(this.text,
      {
        Key? key,
        this.fontSize = 13,
      this.color = Colors.black,
      this.fontWeight = FontWeight.normal,
      this.textAlign = TextAlign.center,
      this.overflow = TextOverflow.visible,
      this.maxLines = 5}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: GoogleFonts.montserrat(
          textStyle: TextStyle(
              color: color,
              fontSize: fontSize.sp,
              fontWeight: fontWeight,
          )),
    );
  }
}
