import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/offers_provider.dart';
import '../screens/resturant_menu.dart';

class OffersWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final offerData = Provider.of<OffersProvider>(context);
    final _offerlist = offerData.offersList;
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: _offerlist.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(ResturantMenu.id,
                  arguments: {'resturantid': _offerlist[index].resurantId});
            },
            child: Container(
              height: size.height * 0.2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: NetworkImage('${_offerlist[index].image}'),
                      fit: BoxFit.cover)),
            ),
          ),
        );
      },
    );
  }
}
