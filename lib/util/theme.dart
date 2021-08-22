

import 'package:flutter/material.dart';

ThemeData appTheme(){

  TextTheme appTextTheme(TextTheme textTheme){
    return textTheme.copyWith(
      headline6: textTheme.headline6!.copyWith(
        fontFamily: 'Nexa',
        fontWeight: FontWeight.bold,
        fontSize: 17.0,
        color: Colors.black
      ),
      headline5: textTheme.headline5!.copyWith(
        fontFamily: 'Nexa',
        fontWeight: FontWeight.normal,
        fontSize: 18.0,
        color: Color(0xFF44546A)
      ),
      headline4: textTheme.headline4!.copyWith(
        fontFamily: 'Nexa',
        fontWeight: FontWeight.normal,
        fontSize: 21.0,
        color: Color(0xFF757272)
      ),
      subtitle2: textTheme.subtitle2!.copyWith(
        fontFamily: 'Nexa',
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
        color: Colors.black
      ),
    );
  }

  final ThemeData base = ThemeData.light();
  return base.copyWith(
    textTheme: appTextTheme(base.textTheme),
    primaryColor: Color(0xFF44546A),
  );

}