import 'dart:async';

import 'package:exam/googlemap/appcostant.dart';
import 'package:exam/googlemap/geolocator_service.dart';
import 'package:exam/googlemap/marker_service.dart';
import 'package:exam/googlemap/place.dart';
import 'package:exam/googlemap/place_service.dart';
import 'package:exam/googlemap/placesearch.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geocoder2/geocoder2.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationProvider with ChangeNotifier {

  final geoLocatorService = GeolocatorService();
  final placesService = PlacesService();
  final markerService = MarkerService();
  late List<PlaceSearch>? searchResults=new List.empty(growable: true);
  StreamController<Place>? selectedLocation = StreamController<Place>.broadcast();
  late StreamController<LatLngBounds> bounds = StreamController<LatLngBounds>.broadcast();
  late Place selectedLocationStatic;
  String? placeType='';
  late List<Place> placeResults;
  ApplicationBloc() {}

  Position _position = Position(longitude: 0, latitude: 0, timestamp: DateTime.now(), accuracy: 1, altitude: 1, heading: 1, speed: 1, speedAccuracy: 1);
  Position _pickPosition = Position(longitude: 0, latitude: 0, timestamp: DateTime.now(), accuracy: 1, altitude: 1, heading: 1, speed: 1, speedAccuracy: 1);
  Position get position => _position;
  Position get pickPosition => _pickPosition;

  bool _loading = false;
  bool get loading => _loading;
  TextEditingController _locationController = TextEditingController();
  TextEditingController get locationController => _locationController;



  Placemark _address = Placemark();
  Placemark _pickAddress = Placemark();
  Placemark get address => _address;
  Placemark get pickAddress => _pickAddress;

  List<Marker> _markers = <Marker>[];
  List<Marker> get markers => _markers;

  String _Address = 'Search here';
  String get Address => _Address;

  void getUpdateLocation(BuildContext context, bool fromAddress, LatLng latlng, {GoogleMapController? mapController}) async {
    _loading = true;
    notifyListeners();
    Position _myPosition;
    _myPosition = Position(
      latitude: latlng.latitude,
      longitude: latlng.longitude,
      timestamp: DateTime.now(), accuracy: 1, altitude: 1, heading: 1, speed: 1, speedAccuracy: 1,
    );
    if(fromAddress) {
      _position = _myPosition;
    }else {
      _pickPosition = _myPosition;
    }
    if (mapController != null) {
      mapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(_myPosition.latitude, _myPosition.longitude), zoom: 17),
      ));
    }
    Placemark _myPlaceMark;
    try {
      _myPlaceMark = Placemark(name: '_address', locality: '', postalCode: '', country: '');
    }catch (e) {
      _myPlaceMark = Placemark(name: '_address', locality: '', postalCode: '', country: '');
    }
    _loading = false;
    notifyListeners();
  }

  void getCurrentLocation(BuildContext context, bool fromAddress, LatLng latlng, {GoogleMapController? mapController}) async {
    _loading = true;
    notifyListeners();
    Position _myPosition;
    try {
      Position newLocalData = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      _myPosition = newLocalData;
    }catch(e) {
      _myPosition = Position(
        latitude: latlng.latitude,
        longitude: latlng.longitude,
        timestamp: DateTime.now(), accuracy: 1, altitude: 1, heading: 1, speed: 1, speedAccuracy: 1,
      );
    }
    if(fromAddress) {
      _position = _myPosition;
    }else {
      _pickPosition = _myPosition;
    }
    if (mapController != null) {
      mapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(_myPosition.latitude, _myPosition.longitude), zoom: 17),
      ));
    }
    Placemark _myPlaceMark;
    try {
      _myPlaceMark = Placemark(name: '_address', locality: '', postalCode: '', country: '');
    }catch (e) {
      _myPlaceMark = Placemark(name: '_address', locality: '', postalCode: '', country: '');
    }
    _loading = false;
    notifyListeners();
  }

  void updatePosition(CameraPosition position, bool fromAddress, String? address, BuildContext context) async {
    _loading = true;
    print(position.target);
    notifyListeners();
    try {
      _pickPosition = Position(
        latitude: position.target.latitude, longitude: position.target.longitude, timestamp: DateTime.now(),
        heading: 1, accuracy: 1, altitude: 1, speedAccuracy: 1, speed: 1,
      );
      GeoData data = await Geocoder2.getDataFromCoordinates(
          latitude: position.target.latitude,
          longitude: position.target.longitude,
          googleMapApiKey: "AIzaSyCTKicbGh6chqaLZTVHiFt889Mmwn29pio");
      _Address=data.address;
    } catch (e) {
      print(e);
    }
    _loading = false;
    notifyListeners();
  }

  bool _isLoading = false;

  bool get isLoading => _isLoading;
  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  searchPlaces(String searchTerm) async {
    searchResults = await placesService.getAutocomplete(searchTerm);
    notifyListeners();
  }

  clearSelectedLocation() async {
    selectedLocationStatic != null;
    searchResults=null;
    placeType = null;
    notifyListeners();
  }

  setSelectedLocation1(String placeId, BuildContext context,GoogleMapController mapController) async {
    var sLocation = await placesService.getPlace(placeId);
    LatLng latLng=LatLng(sLocation.geometry.location.lat,sLocation.geometry.location.lng);
    set_location_search(context, sLocation.geometry.location.lat,sLocation.geometry.location.lng, false,mapController);
    CameraPosition _cameraPosition= CameraPosition(target: LatLng(sLocation.geometry.location.lat, sLocation.geometry.location.lng));
    updatePosition(_cameraPosition, false, null, context);
    set_location_search(context, sLocation.geometry.location.lat,sLocation.geometry.location.lng, false,mapController);
    AppConstants.currentLocation=latLng;
    selectedLocation?.add(sLocation);
    selectedLocationStatic = sLocation;
    notifyListeners();
    searchResults = null!;
  }

  void set_location_search(BuildContext context, double latitude,double longitude,bool fromAddress, GoogleMapController mapController) async {
    _loading = true;
    notifyListeners();
    mapController.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: LatLng(latitude, longitude), zoom: 17),
    ));
    _loading = false;
    notifyListeners();
  }
}
