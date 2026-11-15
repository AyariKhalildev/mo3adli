import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _avg = '0.00';

  double getAveragePercentage() {
    final average = double.tryParse(_avg) ?? 0;
    
    print("the value is ${(average / 20).clamp(0.0, 1.0)}");
    return (average / 20).clamp(0.0, 1.0);
  }

  Color getAverageColor() {
    final average = double.tryParse(_avg) ?? 0;

    if (average < 10) return Colors.red;
    if (average <= 12) return Colors.yellow;
    return Colors.green;
  }

  String getStudentStateImage() {
    final average = double.tryParse(_avg) ?? 0;

    if (average < 10) return 'assets/students-state/sad-student.png';
    if (average <= 12) return 'assets/students-state/okay-student.png';
    return 'assets/students-state/happy-student.png';
  }

  @override
  void initState() {
    super.initState();
    _loadAverage();
  }

  Future<void> _loadAverage() async {
    final prefs = await SharedPreferences.getInstance();
    final savedAverage = prefs.getString('moyenne');
    final average = savedAverage ?? '0.00';

    if (savedAverage == null) {
      await prefs.setString('moyenne', average);
    }

    if (!mounted) return;
    setState(() => _avg = average);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            children: [
                  SizedBox.square(
                    dimension: 300,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        CircularProgressIndicator(
                        color: getAverageColor(),
                        strokeWidth: 12,
                        strokeCap: StrokeCap.round,
                        value: /*getAveragePercentage() */ 0.75,
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Column(
                            children: [
                             Image.asset(
                                getStudentStateImage(),
                                width: 150,
                                height: 150,
                                fit: BoxFit.contain,
                              )
                              ,
                              Text(
                                _avg + "/20",
                                style: Theme.of(context).textTheme.headlineMedium,
                              ),
                          
                            ],
                          ),
                        ),
                      )
                      ],
                    ),
                  ),
                
            ]
          ),
        ),
      ),
    );
  }
}
