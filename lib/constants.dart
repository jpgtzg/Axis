/// Written by Juan Pablo Gutiérrez
/// 02 - 07 - 2023

import 'package:flutter/material.dart';

/* Widget configuration */
const double standartSpacerHeight = 30;

/* Text Configuration */
const String fontFamily = "Manrope";

const TextStyle defaultStyle = TextStyle(
  fontFamily: fontFamily,
  color: Colors.white,
  fontWeight: FontWeight.w700,
  fontSize: 25,
);

const TextStyle substitleStyle = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.w700,
  color: Colors.white,
);
const TextStyle bigTextStyle = TextStyle(
  fontFamily: fontFamily,
  fontWeight: FontWeight.bold,
  color: Colors.white,
  fontSize: 52,
);

/* Color configuration */
const Color paletePink = Color(0xffFF128E);
const Color paletePurple = Color(0xff8310DE);
const Color paleteBlue = Color(0xff1D3BF4);
const Color paleteLightBlue = Color(0xff10CCDE);
const Color paleteBlack = Color(0xff000000);

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
