import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Go{
static  to(BuildContext context,{required String screenName} ){
  return Navigator.pushNamed(context, screenName);
}
}