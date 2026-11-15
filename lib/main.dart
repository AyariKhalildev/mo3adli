import 'package:flutter/material.dart';
import 'package:mo3adli/screens/home_page.dart';

void main() {
  runApp(const Mo3adli());
}

class Mo3adli extends StatelessWidget {
  const Mo3adli({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mo3adli',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomePage(),
    );
  }
}

