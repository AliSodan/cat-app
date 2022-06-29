import 'package:cats_app/core/constants/app_colors.dart';
import 'package:cats_app/core/global_widgets/text_widget.dart';
import 'package:cats_app/core/utils/responsive_controlers.dart/responsive_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatefulWidget {
  CustomButton(
      {Key? key,
      required this.isTapped,
      required this.onTap,
      required this.buttonText,
      required this.onHighLightedChanged
      })
      : super(key: key);
  bool isTapped = false;
  final String buttonText;
  void Function() onTap;
  void Function(bool value) onHighLightedChanged;
  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onHighlightChanged:widget.onHighLightedChanged,
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastLinearToSlowEaseIn,
        height:
            widget.isTapped ? Ratio.h(context) * 0.053   : Ratio.h(context) * 0.06,
        width:
            widget.isTapped ? Ratio.w(context) * 0.3 : Ratio.w(context) * 0.32,
        decoration: BoxDecoration(
          color: Colorful.mainColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: Center(
          child: Text(
            widget.buttonText,
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
