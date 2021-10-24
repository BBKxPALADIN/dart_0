import 'package:flutter/material.dart';

class ImplicitAnimation extends StatefulWidget {
  const ImplicitAnimation({Key key}) : super(key: key);

  @override
  _ImplicitAnimationState createState() => _ImplicitAnimationState();
}

class _ImplicitAnimationState extends State<ImplicitAnimation> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('Hello'),
      ),
    );
  }
}
