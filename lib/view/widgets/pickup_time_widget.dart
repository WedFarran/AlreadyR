import 'package:flutter/material.dart';
import '../../constants/layout_constant.dart';

// ignore: must_be_immutable
class PickUpTimeWidget extends StatelessWidget {
  double pickupTime;
  PickUpTimeWidget({required this.pickupTime});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          child: Text(
            "", // AppLocale.of(BuildContext, context).getTranslations("pick_up_time"),
            style: Lightgrey20,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 30.0,
            right: 30.0,
            top: 10.0,
          ),
          child: Container(
            height: size.height * 0.15,
            width: size.width * 0.8,
            decoration: BoxDecoration(
                color: white,
                boxShadow: [
                  BoxShadow(
                      color: grey, blurRadius: 8.0, offset: Offset(0.0, 10.0))
                ],
                borderRadius: BorderRadius.circular(20.0)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "", // AppLocale.of(BuildContext, context)
                  //     .getTranslations("right_now"),
                  style: (pickupTime <= 15) ? selectedType : unselectedType,
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Text(
                  // AppLocale.of(BuildContext, context)
                  "", //    .getTranslations("after_30_minutes"),
                  style: (pickupTime > 15 || pickupTime < 30)
                      ? selectedType
                      : unselectedType,
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Text(
                  "", //AppLocale.of(BuildContext, context)
                  //.getTranslations("after_1_hour"),
                  style: (pickupTime > 30) ? selectedType : unselectedType,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
