import 'package:chatapp/api/screeninfo.dart';
import 'package:flutter/material.dart';

class resue {
  TextStyle getUserTextStyle() {
    return TextStyle(color: Colors.black, fontWeight: FontWeight.w400);
  }

  Color getAppbarColor(){
    return Color.fromRGBO(246, 246, 252, 1);
  }
  InputDecoration textBoxStyle(text, context) {
    final screen = ScreenInfo(context);
    return InputDecoration(
      contentPadding: EdgeInsets.symmetric(
          vertical: screen.getHeight * 0.02,
          horizontal: screen.getWidth * 0.025),
      hintText: text,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    );
  }

  TextStyle getAppbarTextStyle() {
    return TextStyle(color: Colors.black);
  }

  Color getColor() {
    return Color.fromRGBO(2, 136, 209, 1);
  }

  ShapeBorder getButtonStyle() {
    return RoundedRectangleBorder(borderRadius: BorderRadius.circular(10));
  }

//Small font
  TextStyle getSmallTextStyle(context) {

    final screen = ScreenInfo(context);
    print(MediaQuery.of(context).devicePixelRatio);
    return TextStyle(
      color: Colors.black,
      letterSpacing: 1,
      fontSize:MediaQuery.of(context).devicePixelRatio*5.5
    );
  }

  TextStyle getButtonTextStyle() {
    return TextStyle(
      color: Colors.white,
      letterSpacing: 1,
    );
  }

  //Get Theme data
  ThemeData getThemeData(context) {
    return Theme.of(context).copyWith(
      canvasColor: Color.fromRGBO(55, 55, 90, 1),
      primaryColor: this.getColor(),
    );
  }
}

resue reuse = resue();
