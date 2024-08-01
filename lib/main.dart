import 'package:date_calculator_app/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
    // statusBarColor: Colors.blueAccent, // Color for Android
      statusBarBrightness: Brightness.light // Dark == white status bar -- for IOS.
  ));

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}