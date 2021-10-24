import 'package:flutter/material.dart';

import 'explicit_animation.dart';
import 'home_screen.dart';
import 'implicit_animation.dart';

void main()=>runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Experiment with Animations',
      routes: {
        '/':(context)=>const HomeScreen(),
        '/implicit':(context)=>ImplicitAnimation(),
        '/explicit':(context)=>ExplicitAnimation(),
      },
    );
  }
}
