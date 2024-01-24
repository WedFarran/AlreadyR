import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../constants/layout_constant.dart';

class DirectionWidget extends StatefulWidget {
  @override
  _DirectionWidgetState createState() => _DirectionWidgetState();
}

class _DirectionWidgetState extends State<DirectionWidget> {
  @override
  Widget build(BuildContext context) {
    final CameraPosition _initialposition =
        CameraPosition(target: LatLng(21.422510, 39.826168), zoom: 10);

    void onMapcreated(controller) {
      setState(() {
        // GoogleMapController _mapController = controller;
      });
    }

    Widget _directionMapSheet() => GoogleMap(
        onMapCreated: onMapcreated, initialCameraPosition: _initialposition);

    return ElevatedButton.icon(
      onPressed: () {
        showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.0),
            ),
            isScrollControlled: false,
            context: context,
            builder: (context) => _directionMapSheet());
      },
      icon: direction,
      label: Text(
        "", //AppLocale.of(BuildContext, context).getTranslations("directions"),
        style: directionStyle,
      ),
      style: ElevatedButton.styleFrom(
          primary: white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0))),
    );
  }
}
