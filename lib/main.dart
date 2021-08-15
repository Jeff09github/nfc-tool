import 'package:flutter/material.dart';

import 'ui/home_page.dart';
import 'util/theme.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NFC Tool',
      theme: appTheme(),
      home: HomePage(),
    );
  }
}


