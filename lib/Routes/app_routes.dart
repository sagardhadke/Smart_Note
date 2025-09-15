import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smart_note/Screens/create_notes.dart';
import 'package:smart_note/Screens/home_screen.dart';
import 'package:smart_note/Screens/notes_details.dart';
import 'package:smart_note/Screens/splash_screen.dart';

class AppRoutes {
  
  static const String home = '/home';
  static const String splash = '/splash';
  static const String notesDetails = '/notesDetails';
  static const String createNotes = '/createNotes';


  static Map<String,WidgetBuilder> mRouts = {
    AppRoutes.home : (_) => MyHomePage(),
    AppRoutes.createNotes : (_) => CreateNotes(),
    AppRoutes.notesDetails : (_) => MyNoteDetails(),
    AppRoutes.splash : (_) => MySplashPage(),
  };

}