import 'package:flutter/material.dart';
import 'package:flutter_learning/profile/first_screen.dart';

void main() {
  runApp(const flutter_learning());
}

class flutter_learning extends StatelessWidget {
  const flutter_learning({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor:const Color(0xFFF7F7F7),
      ),
      home: const FirstProfileScreen(),
    );
  }
}



  
