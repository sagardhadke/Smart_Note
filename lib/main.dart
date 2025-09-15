import 'package:flutter/material.dart';
import 'package:smart_note/Routes/app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoutes.splash,
      routes: AppRoutes.mRouts,
      debugShowCheckedModeBanner: false,
    );
  }
}
