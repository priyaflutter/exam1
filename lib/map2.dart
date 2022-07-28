import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import "package:google_maps_webservice/places.dart";

class map2 extends StatefulWidget {
  const map2({Key? key}) : super(key: key);

  @override
  State<map2> createState() => _map2State();
}

class _map2State extends State<map2> {
  late GoogleMapController mapController;
  String? searbar;
  TextEditingController map1 = TextEditingController();
  Set<Marker> markerLIst = {};
   static const CameraPosition initialCameraPosition = CameraPosition(target: LatLng(37.7128, -122.00),zoom: 14.00);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: homeScaffoldkey,
      appBar: AppBar(
        title: Text("MAP"),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          GoogleMap(
            onMapCreated: onMapCreated,
            markers: markerLIst,
            initialCameraPosition: initialCameraPosition,
                
                // CameraPosition(target: LatLng(37.7128, -122.00), zoom: 12.00),
          ),
          Positioned(
              child: Container(
            height: 50,
            width: double.infinity,
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searbar = value;
                });
              },
              onTap: () {
                serachnavigator();
              },
              controller: map1,
              maxLines: 2,
              decoration: InputDecoration(
                hintText: "Search here",
                suffixIcon: const Icon(
                  Icons.location_on_sharp,
                  color: Colors.blue,
                ),
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white)),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ))
        ],
      ),
    );
  }

  onMapCreated(controller) {
    setState(() {
      mapController = controller;
    });
  }

  Future<void> serachnavigator() async {
    Prediction? p = await PlacesAutocomplete.show(
        context: context,
        apiKey: googleAPiKey,
        onError: onError,
        mode: Mode.overlay,
        language: 'en',
        strictbounds: false,
        decoration: InputDecoration(
          hintText: "Search",
        ),
        types: [""],
        components: [Component(Component.country, "IN")]);

    displayPrediction(p!, homeScaffoldkey.currentState);
  }

  void onError(PlacesAutocompleteResponse response) {
    homeScaffoldkey.currentState!
        .showSnackBar(SnackBar(content: Text(response.errorMessage!)));
  }

  String googleAPiKey = "AIzaSyDltQWyzMUWVOgaIpHBy_j_tnfqFFjzlw8";
  final homeScaffoldkey = GlobalKey<ScaffoldState>();

  Future<void> displayPrediction(
      Prediction p, ScaffoldState? currentState) async {
    GoogleMapsPlaces places = GoogleMapsPlaces(
        apiKey: googleAPiKey,
        apiHeaders: await const GoogleApiHeaders().getHeaders());

    PlacesDetailsResponse detail = await places.getDetailsByPlaceId(p.placeId!);

    final lat = detail.result.geometry!.location.lat;
    final lng = detail.result.geometry!.location.lng;

    markerLIst.clear();
    markerLIst.add(Marker(
        markerId: const MarkerId("0"),
        position: LatLng(lat, lng),
        infoWindow: InfoWindow(title: detail.result.name)));

    setState(() {});

    mapController.animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat,lng), 14.00));
  }
}


//https://www.youtube.com/watch?v=Gcw1-8DpqCI