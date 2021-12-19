import 'package:flutter/material.dart';
import 'home.dart';
import 'InputScreens/nBusBarsPage.dart';
import 'InputScreens/nbars_page.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xff121530),
        scaffoldBackgroundColor: const Color(0xff090F31), // Choose the background color Color(0xffHEX)
      ),
      home: NBusBarsPage(),
    );
  }
}
