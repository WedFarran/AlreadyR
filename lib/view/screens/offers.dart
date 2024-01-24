import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/provider/offers_provider.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/offers_widget.dart';

class Offers extends StatelessWidget {
  static const String id = 'offer_screen';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: CustomAppBar(appBarTitle: "offers"),
        body: FutureBuilder(
            future: Provider.of<OffersProvider>(context, listen: false)
                .fetchOffers(),
            builder: (ctx, dataSnapshot) {
              if (dataSnapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else {
                if (dataSnapshot.error != null) {
                  // ...
                  // Do error handling stuff
                  return Center(
                    child: Text('An error occurred!'),
                  );
                } else {
                  return RefreshIndicator(
                      onRefresh: () async {
                        await Provider.of<OffersProvider>(context,
                                listen: false)
                            .fetchOffers();
                      },
                      child: ListView(
                        children: [
                          Container(
                            height: size.height,
                            child: Padding(
                                padding: const EdgeInsets.only(bottom: 150.0),
                                child: OffersWidget()),
                          )
                        ],
                      ));
                }
              }
            }));
  }
}
