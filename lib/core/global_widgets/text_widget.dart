import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    Key? key,
    required this.text,
    required this.textColor,
    required this.textFontSize,
    required this.textFontWeight,
  }) : super(key: key);
  final String text;
  final Color textColor;
  final double textFontSize;
  final FontWeight textFontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        textStyle: TextStyle(
          color: textColor,
          fontSize: textFontSize,
          fontWeight: textFontWeight,
        ),
      ),
    );
  }
}
