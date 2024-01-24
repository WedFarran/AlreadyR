import 'dart:convert';
import 'package:alreadyr/constants/db_constant.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

import '../../model/resurants_model.dart';

class ResturantListProvider with ChangeNotifier {
  List<ResturantList> _resutantList = [];

  Future<void> fetchResturants() async {
    try {
      final response = await http.get(Uri.parse('$DB_URL$DB_RESTURANTS.json'));
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<ResturantList> loadedResturants = [];

      extractedData.forEach((resId, resData) {
        loadedResturants.add(ResturantList(
          id: resId,
          restitle: resData[ResturantList.RESTURANTTITLE],
          category: resData[ResturantList.CATEGORY],
          image: resData[ResturantList.IMAGE],
          branch: (resData[ResturantList.BRANCH] as List<dynamic>)
              .map((position) => Branch(
                  latitude: position[Branch.LATITUDE],
                  longitude: position[Branch.LONGITUDE]))
              .toList(),
        ));
      });
      _resutantList = loadedResturants;
      notifyListeners();
    } catch (error) {
      print(error);
      throw (error);
    }
  }

  List<ResturantList> get resturantlist {
    return [..._resutantList];
  }

  Future<double> destancecalculator(double reslat, double reslang) async {
    double distance = 0.0;
    Position userPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    distance = Geolocator.distanceBetween(
        userPosition.latitude, userPosition.longitude, reslat, reslang);
    return distance;
  }
}
