import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Testing Animations'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
                'Push animation\'s name \r to watch example of using!!!'),
            const SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/implicit');
              },
              child: const Text('Implicit Animation'),
            ),
            const SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/explicit');
              },
              child: const Text('Explicit Animation'),
            ),
          ],
        ),
      ),
    );
  }
}
