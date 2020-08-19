
import 'dart:ui';
import 'package:adams/mic-Color/service/impl/ColorService.dart';
import 'package:flutter/material.dart';

class ColorServiceImpl implements ColorService{

  @override
  Color returnColor(String action) {
    var colorCode;
    switch(action) {
      case "Appointment": {  colorCode = Colors.red[600]; }
      break;

      case "Disease": {  colorCode = Colors.yellow[600]; }
      break;

      case "Drug": {  colorCode = Colors.blue[600]; }
      break;

      case "Clinic": {  colorCode = Colors.green[600]; }
      break;

      default: { colorCode = Colors.pink[600]; }
      break;
    }
    print(colorCode);
    assert(colorCode);
    return colorCode;
  }
  
}