import 'package:flutter/cupertino.dart';

class Ratio{
  static h(BuildContext context ){
    return MediaQuery.of(context).size.height;
  }
  static w(BuildContext context){
    return MediaQuery.of(context).size.width;
  }
}