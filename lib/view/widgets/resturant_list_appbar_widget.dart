import 'package:flutter/material.dart';

import '../../constants/layout_constant.dart';
import '../../model/resturantsearch.dart';

class ResturantListAppBarWidget extends StatelessWidget {
  final String categoryImage;

  const ResturantListAppBarWidget({
    required this.categoryImage,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.15,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(categoryImage), // need a better way
        fit: BoxFit.fill,
      )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              padding: const EdgeInsets.only(bottom: 60),
              icon: arrowBackIos,
              onPressed: () {
                Navigator.pop(context);
              }),
          IconButton(
              padding: EdgeInsets.only(bottom: 60),
              icon: search,
              onPressed: () {
                showSearch(context: context, delegate: RsturantSearch());
              }),
        ],
      ),
    );
  }
}
