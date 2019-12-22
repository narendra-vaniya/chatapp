import 'package:flutter/material.dart';

class ScreenInfo{

  //pro
  double _width;
  double _height;

  //con
  ScreenInfo(BuildContext context): 
    this._width=MediaQuery.of(context).size.width, 
    this._height = MediaQuery.of(context).size.height;

  //Setter
  set setHeight(double h)=>this._height = h;
  set setWidth(double w)=>this._width = w;


  //Getter 
  double get getHeight => this._height ;
  double get getWidth => this._width ;



}



