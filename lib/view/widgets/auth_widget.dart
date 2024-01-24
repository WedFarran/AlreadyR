import 'package:flutter/material.dart';

import '../../constants/layout_constant.dart';

class AuthWidget extends StatelessWidget {
  const AuthWidget(
      {required this.size, required this.imageAsset, required this.widgett});

  final Size size;

  final String imageAsset;
  final Widget widgett;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                      padding: EdgeInsets.only(left: 10.0),
                      alignment: Alignment.topLeft,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: arrowBackIos),
                ],
              ),
              Image.asset(
                imageAsset,
                height: size.height * 0.20,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Container(
                    height: size.height * 0.64,
                    width: size.width,
                    decoration: BoxDecoration(
                      color: white,
                      boxShadow: [
                        BoxShadow(
                            color: darkGrey,
                            blurRadius: 8.0,
                            offset: Offset(3.0, -0.8))
                      ],
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(35.0),
                      ),
                    ),
                    child: widgett),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
