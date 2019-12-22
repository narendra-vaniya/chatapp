import 'package:chatapp/api/screeninfo.dart';
import 'package:flutter/material.dart';

class resue {
  
  InputDecoration textBoxStyle(text,context) {
    final screen = ScreenInfo(context);
    return InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical:screen.getHeight*0.02,horizontal: screen.getWidth*0.025),
      hintText: text,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
    );
  }
  TextStyle getAppbarTextStyle(){
    return TextStyle(fontWeight: FontWeight.normal);
  }
  Color getColor() {
    return Color.fromRGBO(2, 136, 209, 1);
  }

  ShapeBorder getButtonStyle() {
    return RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));
  }

  TextStyle getButtonTextStyle(){
    return TextStyle(
      color: Colors.white,
      letterSpacing: 1,
       
      );
  }

  //Get Theme data
  ThemeData getThemeData(){
    return  ThemeData(
        primaryColor: this.getColor(),
        
      );
  }
}

resue Reuse = resue();
