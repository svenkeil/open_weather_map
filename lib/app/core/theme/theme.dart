import 'package:flutter/material.dart';

final appTheme = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: TextTheme(
    headline1: TextStyle(
      fontFamily: 'SourceSansPro',
      fontSize: 120.0,
      fontWeight: FontWeight.w700,
      letterSpacing: -1.5,
    ),
    headline4: TextStyle(
      fontFamily: 'SourceSansPro',
      fontSize: 34.0,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.25,
    ),
    headline5: TextStyle(
      fontFamily: 'SourceSansPro',
      fontSize: 24.0,
      fontWeight: FontWeight.normal,
      letterSpacing: 0,
    ),
    headline6: TextStyle(
      fontFamily: 'SourceSansPro',
      fontSize: 20.0,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.15,
    ),
    subtitle1: TextStyle(
      fontFamily: 'SourceSansPro',
      fontSize: 16.0,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.5,
    ),
    subtitle2: TextStyle(
      fontFamily: 'SourceSansPro',
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.25,
    ),
    button: TextStyle(
      fontFamily: 'SourceSansPro',
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.25,
    ),
    caption: TextStyle(
      fontFamily: 'SourceSansPro',
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
    ),
  ),
  primaryColor: Colors.deepOrange[600],
  accentColor: Colors.deepOrange[600],
);
