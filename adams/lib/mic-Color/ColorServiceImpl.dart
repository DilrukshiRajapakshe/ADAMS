
import 'package:adams/mic-Color/impl/ColorService.dart';

class ColorServiceImpl implements ColorService{

  @override
  String returnColor(String action) {
    String colorCode = "Purple";
    switch(action) {
      case "Appointment": {  colorCode = "Green"; }
      break;

      case "Disease": {  colorCode = "Yellow"; }
      break;

      case "Drug": {  colorCode = "Blue"; }
      break;

      case "Clinic": {  colorCode = "Red"; }
      break;

      default: { colorCode = "Purple"; }
      break;
    }
    return colorCode;
  }
  
}