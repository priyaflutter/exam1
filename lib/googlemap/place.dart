
import 'package:exam/googlemap/Geometry.dart';


class Place {
  late Geometry geometry;
  late String name;
  late String vicinity;

  Place({required this.geometry,required this.name,required this.vicinity});

  factory Place.fromJson(Map<String,dynamic> json){
    return Place(
      geometry:  Geometry.fromJson(json['geometry']),
      name: json['formatted_address'],
      vicinity: json['vicinity'],
    );
  }
}