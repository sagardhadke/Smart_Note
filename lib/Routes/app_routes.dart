import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smart_note/Screens/home_screen.dart';

class AppRoutes {
  
  static const String home = '/home';
  static const String splash = '/splash';
  static const String notesDetails = '/notesDetails';
  static const String createNotes = '/createNotes';


  static Map<String,WidgetBuilder> mRouts = {
    AppRoutes.home : (_) => MyHomePage()
  };

}