// import 'dart:math';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_geocoder/geocoder.dart';
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'googlemap/location.dart';
//
// class mapscreen extends StatefulWidget {
//   const mapscreen({Key? key}) : super(key: key);
//
//   @override
//   State<mapscreen> createState() => _mapscreenState();
// }
//
// class _mapscreenState extends State<mapscreen> {
//   TextEditingController map = TextEditingController();
//   TextEditingController map1 = TextEditingController();
//   GoogleMapController? _controller;
//   Location currentlocation = Location();
//   Set<Marker> _marker = {};
//   String? _address = 'Select Address';
//   bool search = false;
//   // PolylinePoints polylinePoints = PolylinePoints();
//   // Map<PolylineId, Polyline> polylines = {};
//   // double distance = 0.0;
//   // String googleAPiKey = "AIzaSyDltQWyzMUWVOgaIpHBy_j_tnfqFFjzlw8";
//
//   Future<void> getLocation() async {
//     currentlocation.onLocationChanged.listen((LocationData Loc) async {
//       _controller
//           ?.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
//           target: LatLng(Loc.latitude ?? 0.0, Loc.longitude ?? 0.0),
//           zoom: 15)));
//
//         final coordinates1 = new Coordinates(Loc.latitude, Loc.longitude);
//         var addresses1 = await Geocoder.local.findAddressesFromCoordinates(
//             coordinates1);
//         var first = addresses1.first;
//         print("${first.featureName} : ${first.addressLine}");
//         _address = '${first.addressLine}';
//         map.text = '${_address}';
//         _marker.add(
//             Marker(markerId: MarkerId('Home'),
//               position: LatLng(Loc.latitude ?? 0.0, Loc.longitude ?? 0.0),
//               infoWindow: InfoWindow( //popup info
//                 title: 'Starting Point ',
//                 snippet: 'Start Marker',
//               ),
//               icon: BitmapDescriptor.defaultMarker,
//             )
//         );
//
//     });
//   }
//
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     setState(() {
//       getLocation();
//       // getDirections();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Map Location"),
//       ),
//       floatingActionButton: FloatingActionButton(
//           child: Icon(
//             Icons.location_searching,
//             color: Colors.white,
//           ),
//           onPressed: () {
//             getLocation();
//           }),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             TextField(
//               onTap: () {
//                 setState(() {
//                   search = true;
//                 });
//               },
//               controller: map,
//               maxLines: 2,
//               decoration: InputDecoration(
//                 prefixIcon: const Icon(
//                   Icons.location_on_sharp,
//                   color: Colors.blue,
//                 ),
//                 suffixIcon: IconButton(onPressed: () {
//                   setState(() {
//                     search = true;
//                   });
//                 }, icon: Icon(Icons.close)),
//                 border: InputBorder.none,
//                 enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: BorderSide(color: Colors.white)),
//                 focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: BorderSide(color: Colors.white)),
//                 filled: true,
//                 fillColor: Colors.white,
//               ),
//             ),
//             Container(
//               height: 590,
//               width: MediaQuery
//                   .of(context)
//                   .size
//                   .width,
//               child: GoogleMap(
//                 zoomControlsEnabled: false,
//                 indoorViewEnabled: true,
//                 myLocationEnabled: true,
//                 mapToolbarEnabled: true,
//                 mapType: MapType.normal,
//                 initialCameraPosition: const CameraPosition(
//                   target: LatLng(80.9461592, 26.8467088),
//                   zoom: 12.0,
//                 ),
//                 onMapCreated: (GoogleMapController controller) {
//                   _controller = controller;
//                 },
//                 markers: _marker,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//   // LatLng startLocation = LatLng(27.6683619, 85.3101895);
//   // LatLng endLocation = LatLng(27.6875436, 85.2751138);
//   // getDirections() async {
//   //   List<LatLng> polylineCoordinates = [];
//   //
//   //   PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
//   //     googleAPiKey,
//   //     PointLatLng(startLocation.latitude, startLocation.longitude),
//   //     PointLatLng(endLocation.latitude, endLocation.longitude),
//   //     travelMode: TravelMode.driving,
//   //   );
//   //
//   //   if (result.points.isNotEmpty) {
//   //     result.points.forEach((PointLatLng point) {
//   //       polylineCoordinates.add(LatLng(point.latitude, point.longitude));
//   //     });
//   //   } else {
//   //     print(result.errorMessage);
//   //   }
//   //
//   //   //polulineCoordinates is the List of longitute and latidtude.
//   //   double totalDistance = 0;
//   //   for(var i = 0; i < polylineCoordinates.length-1; i++){
//   //     totalDistance += calculateDistance(
//   //         polylineCoordinates[i].latitude,
//   //         polylineCoordinates[i].longitude,
//   //         polylineCoordinates[i+1].latitude,
//   //         polylineCoordinates[i+1].longitude);
//   //   }
//   //   print(totalDistance);
//   //
//   //   setState(() {
//   //     distance = totalDistance;
//   //   });
//   //
//   //   //add to the list of poly line coordinates
//   //   addPolyLine(polylineCoordinates);
//   // }
//   //
//   // addPolyLine(List<LatLng> polylineCoordinates) {
//   //   PolylineId id = PolylineId("poly");
//   //   Polyline polyline = Polyline(
//   //     polylineId: id,
//   //     color: Colors.deepPurpleAccent,
//   //     points: polylineCoordinates,
//   //     width: 8,
//   //   );
//   //   polylines[id] = polyline;
//   //   setState(() {});
//   // }
//   //
//   // double calculateDistance(lat1, lon1, lat2, lon2){
//   //   var p = 0.017453292519943295;
//   //   var a = 0.5 - cos((lat2 - lat1) * p)/2 +
//   //       cos(lat1 * p) * cos(lat2 * p) *
//   //           (1 - cos((lon2 - lon1) * p))/2;
//   //   return 12742 * asin(sqrt(a));
//   // }
//
// }
//
//
// //TODO
//
// // import 'package:flutter/material.dart';
// //
// // class MyBehavior extends ScrollBehavior {
// //   @override
// //   Widget buildOverscrollIndicator(
// //       BuildContext context, Widget child, ScrollableDetails details) {
// //     return child;
// //   }
// // }
//
// // Flexible(child: ScrollConfiguration(
// // behavior: MyBehavior(),