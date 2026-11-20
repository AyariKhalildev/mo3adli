import 'package:flutter/material.dart';

class ChooseGradeScreen extends StatefulWidget {
  @override
  State<ChooseGradeScreen> createState() => _ChooseGradeScreenState();
}

class _ChooseGradeScreenState extends State<ChooseGradeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9E7FF),
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
                ),
                Text(
                  "a5tar classik",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 58, 58, 58),
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                  ),),
                  SizedBox(
                    height: 12,
                  ),
                  Expanded(
                    child: Container(
                      
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                "assets/schoolBag.png",
                                height: 100,
                                width: 100,
                                ),
                              Text(
                                "a5tar classic:",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16
                                ),)
                            ],
                          )
                        ],
                      ),
                    ),
                  )
            ],
          ),
        ),
      ),
    );
  }
}
