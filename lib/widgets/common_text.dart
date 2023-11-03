import 'package:airportdemo1/app/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonSoraText extends StatelessWidget {
  final String text;
  final double textSize;
  final Color? color;
  final TextDecoration? decoration;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;

  const CommonSoraText(
      {Key? key,
      required this.text,
      required this.textSize,
      this.color,
      this.decoration,
      this.fontWeight,
      this.textAlign,
      this.overflow,
      this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      softWrap: true,
      maxLines: maxLines,
      style: TextStyle(color: color , fontSize: textSize, decoration: decoration, fontWeight: fontWeight,height: 1.5,fontFamily: AppFonts.sora)

    );
  }
}

