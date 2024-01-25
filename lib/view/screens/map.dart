import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../constants/layout_constant.dart';
import '../../controller/provider/resturant_list_provider.dart';
import '../widgets/custom_app_bar.dart';

class MapScreen extends StatefulWidget {
  static const String id = 'map_screen';

  const MapScreen({super.key});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController _mapController;
  late String _searchAddres;
  Set<Marker> _markers = {};
  late BitmapDescriptor mapMarker;

  @override
  void initState() {
    super.initState();
    setCustomeMarker();
  }

  void setCustomeMarker() async {
    mapMarker = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'assets/images/random/icon.png');
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<ResturantListProvider>(context);
    Size size = MediaQuery.of(context).size;
    final CameraPosition _initialposition =
        CameraPosition(target: LatLng(21.422510, 39.826168), zoom: 10);
    return Scaffold(
      appBar: CustomAppBar(appBarTitle: "map"),
      body: Stack(
        children: [
          GoogleMap(
              zoomControlsEnabled: true,
              zoomGesturesEnabled: true,
              myLocationEnabled: true,
              onMapCreated: onMapcreated,
              markers: _markers,
              initialCameraPosition: _initialposition),
          Positioned(
            top: 80.0,
            right: 15.0,
            left: 15.0,
            child: Container(
              height: size.height * 0.06,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0), color: white),
              child: TextField(
                decoration: InputDecoration(
                    hintText:
                        "", // AppLocale.of(BuildContext, context).getTranslations("find_resturant"),
                    border: InputBorder.none,
                    contentPadding:
                        const EdgeInsets.only(left: 15.0, top: 15.0),
                    suffixIcon: IconButton(
                        icon: search,
                        onPressed: searchandNavigate,
                        iconSize: 30.0)),
                onChanged: (val) {
                  setState(() {
                    _searchAddres = val;
                  });
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  void onMapcreated(controller) {
    setState(() {
      _mapController = controller;
      _markers.add(Marker(
          markerId: MarkerId('resturantid'),
          infoWindow: InfoWindow(title: ' Rashafat Caffe'),
          icon: mapMarker,
          position: LatLng(21.48632764327786,
              39.22890241611304) /*should be added auto from FB*/));
    });
  }

  searchandNavigate() {
    locationFromAddress(_searchAddres).then((result) {
      _mapController.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(
              target: LatLng(result[0].latitude, result[0].longitude),
              zoom: 10.0)));
    });
  }
}
