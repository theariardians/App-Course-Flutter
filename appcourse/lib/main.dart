import 'package:flutter/material.dart';
import 'package:appcourse/screens/root_app.dart';
import 'package:appcourse/theme/color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Course',
      theme: ThemeData(
        scaffoldBackgroundColor: appBgColor,
        primaryColor: primary,
      ),
      home: const RootApp(),
    );
  }
}
