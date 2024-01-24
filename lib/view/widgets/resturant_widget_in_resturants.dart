import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/layout_constant.dart';
import '../../controller/provider/resturant_list_provider.dart';
import '../../controller/services/category_items_list_provider.dart';
import '../screens/resturant_menu.dart';

class ResturantsWidget extends StatelessWidget {
  final int categoryid;
  ResturantsWidget({required this.categoryid});

  @override
  Widget build(BuildContext context) {
    final _resturantsData = Provider.of<ResturantListProvider>(context);
    Size size = MediaQuery.of(context).size;
    Future<double> distance;
    // ignore: unused_element
    Future<double> resD(double relat, double reslong) async {
      double distance = 0.0;
      _resturantsData
          .destancecalculator(relat, reslong)
          .then((value) => distance = value);
      return distance;
    }

    final filtterdR = Provider.of<CategoryItemListService>(context)
        .filtterR(categoryid, context);
    return filtterdR.length == 0
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'couldnt find resturant in this category "-" ',
                  style: resTitleS,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          )
        : ListView.builder(
            itemCount: filtterdR.length,
            itemBuilder: (context, index) {
              return Padding(
                  padding:
                      const EdgeInsets.only(left: 10.0, right: 10.0, top: 50.0),
                  child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(ResturantMenu.id,
                            arguments: {
                              'resturanttitle': filtterdR[index].restitle,
                              'resturantid': filtterdR[index].id
                            });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                              child: Row(children: [
                            Image(
                                image: AssetImage(
                                    'assets/images/random/Albaik_logo.jpg'), //NetworkImage(_resturantsData.resturantlist[index].image),
                                fit: BoxFit.cover,
                                height: size.height * 0.10,
                                width: size.height * 0.10),
                            const SizedBox(width: 15.0),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(filtterdR[index].restitle,
                                      style: resTitleS),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  FutureBuilder(
                                      future: distance =
                                          Provider.of<ResturantListProvider>(
                                                  context)
                                              .destancecalculator(
                                                  05.055555, 0.5778477474),
                                      builder: (ctx, dataSnapshot) {
                                        if (dataSnapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return Center(
                                              child:
                                                  CircularProgressIndicator());
                                        } else {
                                          if (dataSnapshot.error != null) {
                                            // ...
                                            // Do error handling stuff
                                            return Center(
                                              child: Text('An error occurred!'),
                                            );
                                          } else {
                                            return Text('$distance km ',
                                                style: priceS);
                                          }
                                        }
                                      }),
                                  // resD(filtterdR[index].resLat, filtterdR[index].resLat).then((value) => distance=value),
                                ])
                          ])),
                        ],
                      )));
            });
  }
}
//resD(filtterdR[index].resLat, filtterdR[index].resLat)