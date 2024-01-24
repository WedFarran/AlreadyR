import 'package:flutter/material.dart';

//////////colors////////////////
const Color white = Colors.white;
Color grey = Colors.grey;
Color yellowC = Color(0xFFF9AD30);
Color red = Color(0xFFC63C3C);
Color black = Colors.black;
Color darkGrey = Colors.grey.shade800;
Color green = Color(0xFF97CF6E);
Color bGrey = Color(0xFFE5E5E5);
////////////////icons//////////////
const Icon arrowBackIos = const Icon(
  Icons.arrow_back_ios,
  color: Colors.grey,
  size: 35,
);

const Icon search = const Icon(
  Icons.search,
  color: Colors.grey,
  size: 35,
);

const Icon add = const Icon(
  Icons.add,
  color: Colors.white,
);

const Icon remove = const Icon(
  Icons.remove,
  color: Colors.white,
);

const Icon direction = const Icon(
  Icons.directions,
  color: Colors.red,
  size: 50.0,
);

///////////////text////////////////
const TextStyle appBarS = const TextStyle(
    color: Color(0xFF727272), fontSize: 20, fontWeight: FontWeight.w700);

const TextStyle categoryS =
    const TextStyle(color: white, fontSize: 20, fontWeight: FontWeight.bold);

const TextStyle resTitleS = const TextStyle(
    color: Color(0xFF6F6F6F),
    fontFamily: 'Montserrat',
    fontSize: 17.0,
    fontWeight: FontWeight.bold);

const TextStyle descriptionS = const TextStyle(
    fontFamily: 'Montserrat', fontSize: 13, color: Color(0xFFA6A6A6));
const TextStyle priceS = const TextStyle(
    fontFamily: 'Montserrat', fontSize: 15.0, color: Color(0xFF767676));

const TextStyle quantityStyle = const TextStyle(
    color: Colors.white,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.bold,
    fontSize: 10.0);

const TextStyle directionStyle = const TextStyle(
    color: Colors.red, fontSize: 20.0, fontWeight: FontWeight.bold);

const TextStyle cartBS = const TextStyle(color: Colors.white, fontSize: 16);

// ignore: non_constant_identifier_names
TextStyle Lightgrey20 = TextStyle(
  color: Color(0xFF808080),
  fontSize: 20,
);

// ignore: non_constant_identifier_names
TextStyle Lightgrey17 = TextStyle(
  color: Color(0xFF808080),
  fontSize: 17,
);
// ignore: non_constant_identifier_names
TextStyle Lightgrey14 = TextStyle(
  color: Color(0xFF737373),
  fontSize: 14,
);

TextStyle selectedType = TextStyle(
    color: Color(0xFFffa700), fontSize: 15, fontWeight: FontWeight.w500);

TextStyle unselectedType = TextStyle(
    color: Color(0xFF727272), fontSize: 15, fontWeight: FontWeight.w500);
