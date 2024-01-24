import 'dart:convert';

import 'package:alreadyr/model/map_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../../constants/db_constant.dart';

class MapProvider with ChangeNotifier {
  List<MapModel> _branch = [];

  List<MapModel> get branchList {
    return [..._branch];
  }

  Future<void> fetchBranch(String resId) async {
    try {
      final response = await http
          .get(Uri.parse('$DB_URL$DB_RESTURANTS/$resId/$DB_BRANCH.json'));
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<MapModel> loadedbranch = [];

      extractedData.forEach((branchId, branchData) {
        loadedbranch.add(
          MapModel(
              latitude: branchData[MapModel.LATITUDE],
              longitude: branchData[MapModel.LONGITUDE]),
        );
      });

      _branch = loadedbranch;
      notifyListeners();
    } catch (error) {
      print(error);
      throw (error);
    }
  }
}
