import 'package:exam/googlemap/appcostant.dart';
import 'package:exam/googlemap/color_resource.dart';
import 'package:exam/googlemap/diamation.dart';
import 'package:exam/googlemap/location_provider.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';


class Add_Address_Register_Screen extends StatefulWidget {
  


  @override
  State<Add_Address_Register_Screen> createState() => _Add_Address_Register_ScreenState();
}

class _Add_Address_Register_ScreenState extends State<Add_Address_Register_Screen> {
  final key = 'AIzaSyDltQWyzMUWVOgaIpHBy_j_tnfqFFjzlw8';
  late GoogleMapController _controller;
  late CameraPosition _cameraPosition;
  TextEditingController _address_Controller=TextEditingController();
  TextEditingController _search_address_Controller=TextEditingController();
  late LatLng latlng;
  late LatLng _center;
  late LatLng current_save_lat;
  bool is_loading=true;
  String hint_Text="Search Here";
  String Search_status="0";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserLocation();
  }

  getUserLocation() async {
    Geolocator.isLocationServiceEnabled();
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    var places = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );
    if (places != null && places.isNotEmpty) {
      final Placemark place = places.first;
      setState(() {
        _center = LatLng(position.latitude, position.longitude);
        _cameraPosition=CameraPosition(target: _center);
        latlng=_center;
        current_save_lat=_center;
        is_loading=false;
      });
    }
  }

  loader_close() async {
    setState((){
      is_loading=false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 1,
        titleSpacing: 0,
        centerTitle: true,
        title: Text("Add location", style: TextStyle(fontSize: 15,color: Colors.white)),
      ),

      body: is_loading == true
          ?
      Container(
        width: AppConstants.itemWidth,
        height: AppConstants.itemHeight,
        alignment: Alignment.center,
        child: Center(
          child: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(
              Theme.of(context).primaryColor,
            ),
          ),
        ),
      )
          :
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              child: Consumer<LocationProvider>(
                  builder: (context, locationProvider, child) {
                    _address_Controller.text=locationProvider.Address;
                    hint_Text=locationProvider.Address;
                    return Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.topCenter,
                        children: [
                          GoogleMap(
                            mapType: MapType.normal,
                            initialCameraPosition: CameraPosition(
                              target: latlng,
                              zoom: 17,
                            ),
                            myLocationEnabled: false,
                            zoomControlsEnabled: false,
                            compassEnabled: false,
                            indoorViewEnabled: true,
                            mapToolbarEnabled: true,
                            onCameraIdle: () {locationProvider.updatePosition(_cameraPosition, false, null, context);},
                            onCameraMove: ((_position) {_cameraPosition = _position;}),
                            onMapCreated: (GoogleMapController controller) {
                              _controller = controller;
                              Provider.of<LocationProvider>(context,listen: false).getUpdateLocation(context, false, latlng,mapController: _controller);
                            },
                          ),
                          Center(
                              child: Icon(
                                Icons.location_on,
                                color: Theme.of(context).primaryColor,
                                size: 50,
                              )),
                          Search_status=="1"?Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        controller: _search_address_Controller,
                                        maxLines: 2,
                                        textCapitalization: TextCapitalization.sentences,
                                        keyboardType: TextInputType.text,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,color:Colors.white
                                        ),
                                        textInputAction: TextInputAction.done,
                                        onFieldSubmitted: (v) {},
                                        onChanged: (value) {locationProvider.searchPlaces(value);},
                                        onTap:(){locationProvider.clearSelectedLocation();},
                                        decoration: const InputDecoration(
                                          hintText: 'Search here',
                                          fillColor:
                                          ColorResources.BUTTON_BG,
                                          filled: true,
                                          contentPadding:
                                          EdgeInsets.symmetric(
                                              vertical: 12.0,
                                              horizontal: 15),
                                          isDense: true,
                                          counterText: '',
                                          focusedBorder:
                                          OutlineInputBorder(
                                              borderSide:
                                              BorderSide.none),
                                          hintStyle: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color:
                                              ColorResources.WHITE),
                                          errorStyle:
                                          TextStyle(height: 1.5),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState((){
                                          Search_status="0";
                                        });
                                      },
                                      child: Container(
                                        width: 40,
                                        height: 40,
                                        margin: const EdgeInsets.symmetric(horizontal: 5),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              Dimensions.PADDING_SIZE_SMALL),
                                          color:
                                         Colors.red,
                                        ),
                                        child: Icon(
                                          Icons.close,
                                          color: ColorResources.BUTTON_BG,
                                          size: 30,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Visibility(
                                  visible: _search_address_Controller.text==''?false:true,
                                  child: Container(
                                    height: 300.0,
                                    child: ListView.builder(
                                        itemCount: locationProvider.searchResults?.length,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            color: ColorResources.GREY.withOpacity(0.50),
                                            child: ListTile(
                                              title: Text(locationProvider.searchResults![index].description, style: TextStyle(color: Colors.white),),
                                              onTap: () {
                                                setState(() async {
                                                  Search_status="0";
                                                  _search_address_Controller.clear();
                                                  AppConstants.closeKeyboard();
                                                  hint_Text=locationProvider.searchResults![index].description;
                                                  locationProvider.setSelectedLocation1(locationProvider.searchResults![index].placeId,context,_controller);
                                                });
                                              },
                                            ),
                                          );
                                        }),
                                  ),
                                ),
                              ],
                            ),
                          ):
                          Container(
                            margin: EdgeInsets.symmetric(horizontal:10,vertical: 10),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: TextFormField(
                                      controller: _address_Controller,
                                      maxLines: 1,
                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,color: ColorResources.WHITE),
                                      decoration: const InputDecoration(
                                          enabled: false,
                                          hintText: 'Full Address',
                                          hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,color: ColorResources.WHITE),
                                          border: InputBorder.none,
                                          fillColor: ColorResources.BUTTON_BG,
                                          counterText: '',
                                          filled: true)),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState((){
                                      _search_address_Controller.text='';
                                      Search_status="1";
                                    });
                                  },
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    margin: const EdgeInsets.symmetric(horizontal: 5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.PADDING_SIZE_SMALL),
                                      color:
                                      Colors.red,
                                    ),
                                    child: Icon(
                                      Icons.search,
                                      color: ColorResources.BUTTON_BG,
                                      size: 30,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Positioned(
                              bottom: 0,
                              right: 0,
                              left: 0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  locationProvider.loading
                                      ?
                                  const Padding(
                                    padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        color: ColorResources.BUTTON_BG,
                                      ),
                                    ),
                                  )
                                      :
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
                                          child: Container(
                                            height: 40,
                                            margin: EdgeInsets.symmetric(horizontal: 10, vertical: Dimensions.PADDING_SIZE_SMALL),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                color: ColorResources.BUTTON_BG
                                            ),
                                            child: TextButton(
                                              onPressed: () {

                                                print(":::::::::::::::${_search_address_Controller}");
                                                print(":ADDDDD::::::::::::::${_address_Controller}");
                                                 Navigator.pop(context,_address_Controller);
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                alignment: Alignment.center,
                                                child: Text('Save',
                                                    style: TextStyle(fontSize: 16)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          locationProvider.getCurrentLocation(context, false,current_save_lat, mapController: _controller);
                                        },
                                        child: Container(
                                          width: 40,
                                          height: 40,
                                          margin: const EdgeInsets.only(
                                              right: Dimensions.PADDING_SIZE_LARGE),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                Dimensions.PADDING_SIZE_SMALL),
                                            color:
                                           Colors.red,
                                          ),
                                          child: const Icon(
                                            Icons.my_location,
                                            color: ColorResources.BUTTON_BG,
                                            size: 30,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              )
                          ),
                        ]);
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
