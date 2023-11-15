/// Written by Juan Pablo Gutiérrez
/// 02 - 07 - 2023

import 'package:flutter/material.dart';

enum Origin { match, pit }

/* Widget configuration */
const double standartSpacerHeight = 30;

const double mediumSpacerHeight = 20;

const double smallerSpacerHeight = 10;

/* Text Configuration */
const String fontFamily = "Manrope";

const TextStyle defaultStyle = TextStyle(
  fontFamily: fontFamily,
  color: Colors.white,
  fontWeight: FontWeight.w700,
  fontSize: 25,
);
const TextStyle smallerDefaultStyle = TextStyle(
  fontFamily: fontFamily,
  fontWeight: FontWeight.w700,
  color: Colors.white,
  fontSize: 18,
);

const TextStyle substitleStyle = TextStyle(
  fontFamily: fontFamily,
  fontWeight: FontWeight.w700,
  color: Colors.white,
  fontSize: 15,
);

const TextStyle bigTextStyle = TextStyle(
  fontFamily: fontFamily,
  fontWeight: FontWeight.bold,
  color: Colors.white,
  fontSize: 52,
);

const TextStyle blueAllianceStyle = TextStyle(
  fontFamily: fontFamily,
  fontWeight: FontWeight.w700,
  color: Colors.blue,
  fontSize: 15,
);

const TextStyle redAllianceStyle = TextStyle(
  fontFamily: fontFamily,
  fontWeight: FontWeight.w700,
  color: Colors.red,
  fontSize: 15,
);

/* Color configuration */
const Color paletePink = Color(0xffFF128E);
const Color paletePurple = Color(0xff8310DE);
const Color paleteBlue = Color(0xff1D3BF4);
const Color paleteLightBlue = Color(0xff10CCDE);
const Color paleteBlack = Color(0xff000000);

const Color paleteGreen = Color(0xFF00FF7F);
const Color paleteTeal = Color(0xFF00FFFF);
const Color paleteYellow = Color(0xFFFFFF00);
const Color paleteLighGreen = Color(0xFF90EE90);
const Color paleteOrange = Color(0xFFFFA500);
const Color paleteCoral = Color(0xFFFF7F50);
const Color paleteDarkOrange = Color(0xFFFF8C00);
const Color paleteDarkColar = Color(0xFFFF4500);

const LinearGradient backGroundGradient = LinearGradient(
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
  colors: [
    paleteLightBlue,
    paleteBlue,
  ],
);

const Icon menuIcon = Icon(
  Icons.menu,
  color: Colors.white,
  size: 42,
);
