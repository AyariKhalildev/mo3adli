import 'package:flutter/material.dart';

class ChooseGradeScreen extends StatefulWidget {
  @override
  State<ChooseGradeScreen> createState() => _ChooseGradeScreenState();
}

class _ChooseGradeScreenState extends State<ChooseGradeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/clay.png",
                height: 300,
                width: 300,
                ),
                Text("i7seb mo3adlik",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 34
                ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
