import 'package:flutter/material.dart';
import 'package:flutter_learning/mainscreen.dart';
import 'package:flutter_learning/profile/first_screen.dart';
import 'package:flutter_learning/profile/second_screen.dart';

void main() {
  runApp(const Flutter_Learning());
}

class Flutter_Learning extends StatelessWidget {
  const Flutter_Learning({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Practice App",
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor:const Color(0xFFF7F7F7),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Mainscreen(),
        '/profile1': (context) => const FirstProfileScreen(),
        '/profile2': (context) => const SecondProfileScreen(),
      },
    );
  }
}



  
