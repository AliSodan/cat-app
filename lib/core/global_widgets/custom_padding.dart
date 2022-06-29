import 'package:flutter/material.dart';

class CustomPadding extends StatelessWidget {
   CustomPadding({ Key? key,required this.child ,this.bottom=0.0,this.left=0.0,this.right=0.0,this.top=0.0}) : super(key: key);
  final Widget child;
  final double left;
  final double right;
  final double top;
   double bottom;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: left,right: right,top:top,bottom: bottom),
    );
  }
}