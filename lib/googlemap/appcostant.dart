import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AppConstants{


  static var screenSize;
  static double itemHeight=0.0;
  static double itemWidth=0.0;

  static late LatLng currentLocation;

  static closeKeyboard() {
    return SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

}