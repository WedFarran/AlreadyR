import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/layout_constant.dart';
import '../../controller/provider/resturant_list_provider.dart';
import '../widgets/resturant_list_appbar_widget.dart';
import '../widgets/resturant_widget_in_resturants.dart';

class Resturants extends StatelessWidget {
  static const String id = 'resturants_screen';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final _arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final _categoryImage = _arguments['categoryimage'];
    final _categoryId =
        _arguments['categoryid']; //to find the resturants in the same category

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(children: [
            ResturantListAppBarWidget(
              categoryImage: _categoryImage,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Container(
                  height: size.height,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(25.0),
                        right: Radius.circular(25.0)),
                  ),
                  child: FutureBuilder(
                      future: Provider.of<ResturantListProvider>(context,
                              listen: false)
                          .fetchResturants(),
                      builder: (ctx, dataSnapshot) {
                        if (dataSnapshot.connectionState ==
                            ConnectionState.waiting) {
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
                                await Provider.of<ResturantListProvider>(
                                        context,
                                        listen: false)
                                    .fetchResturants();
                              },
                              child: ResturantsWidget(categoryid: _categoryId),
                            );
                          }
                        }
                      })),
            )
          ]),
        ),
      ),
    );
  }
}
