import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _avg = '0.00';

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
        child: Center(
          child: Text(
            _avg,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
      ),
    );
  }
}
