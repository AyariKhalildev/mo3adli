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
                  SizedBox(
            
                    width: 300,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        CircularProgressIndicator(
                        color: getAverageColor(),
                        strokeWidth: 8,
                        strokeCap: StrokeCap.round,
                        value: getAveragePercentage(),
                      ),
                      Center(
                        child: Text(
                          _avg + "/20",
                          style: Theme.of(context).textTheme.headlineMedium,
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
