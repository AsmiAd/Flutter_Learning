import 'package:flutter/material.dart';

class Mainscreen extends StatelessWidget {
  const Mainscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Screen'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/profile1');
            }, 
            child: const Text('Go to Profile Screen 1'),
          ),

          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/profile2');
            }, 
            child: const Text('Go to Profile Screen 2'),
          ),

        ],
      ),
    );
  }
}