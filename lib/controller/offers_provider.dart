import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../constants/db_constant.dart';
import '../model/offers_model.dart';

class OffersProvider with ChangeNotifier {
  List<Offer> _offerlist = [];

  List<Offer> get offersList {
    return [..._offerlist];
  }

  Future<void> fetchOffers() async {
    try {
      final response = await http.get(Uri.parse('$DB_URL$DB_OFFERS'));
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Offer> loadedOffers = [];

      extractedData.forEach((offerId, offerData) {
        loadedOffers.add(
          Offer(
            offerId: offerId,
            image: offerData[Offer.IMAGE],
            resurantId: offerData[Offer.RESTURANTID],
          ),
        );
        print('fffffffffffffffffffffffff${offerData[Offer.IMAGE]}');
      });
      _offerlist = loadedOffers;
      notifyListeners();
    } catch (error) {
      print(error);
      throw (error);
    }
  }
}
