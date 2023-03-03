import 'package:app_news1/screens/onboarding/OnbordingScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bserver',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.oswaldTextTheme(Theme.of(context).textTheme),
        primarySwatch: Colors.blue,
      ),
      home: OnbordingScreen(),
    );
  }
}

