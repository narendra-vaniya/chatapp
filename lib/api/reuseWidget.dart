import 'package:chatapp/api/screeninfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Resue {
  TextStyle getUserTextStyle() {
    return TextStyle(color: Colors.black, fontWeight: FontWeight.w400);
  }

  Color getAppbarColor() {
    return Color.fromRGBO(246, 246, 252, 1);
  }

  InputDecoration textBoxStyle(text, context) {
    final screen = ScreenInfo(context);
    return InputDecoration(
      contentPadding: EdgeInsets.all(5),
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
    return RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));
  }

//Small font
  TextStyle getSmallTextStyle(context) {
    final screen = ScreenInfo(context);
    return TextStyle(
      color: Colors.black,
      letterSpacing: 1,
    );
  }

//Fittedbox text
  Widget MyText(msg) {
    return FittedBox(
      child: Text(msg),
    );
  }

  TextStyle getButtonTextStyle() {
    return TextStyle(
      color: Colors.white,
      letterSpacing: 1,
      fontSize: ScreenUtil().setSp(12)
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

Resue reuse = Resue();
