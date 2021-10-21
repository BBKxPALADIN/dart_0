import 'package:flutter/material.dart';
import 'profile.dart';
import './models/constants.dart';

void main() => runApp(MyApp());

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({Key key}) : super(key: key);
  ProfileConst profileConst = ProfileConst(
    'Bekzod Kuvondikov',
    'bbkxaladin@gmail.com',
    '+998-99-356-17-23',
    const AssetImage('assets/personal_photo.png'),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(builder: (context) => const HomeScreen());
        }
        final uri = Uri.parse(settings.name);
        if (uri.pathSegments.length == 2 &&
            uri.pathSegments.first == 'profile') {
          final id = uri.pathSegments[1];
          return MaterialPageRoute(
              builder: (context) => Profile(profile: profileConst, id: id));
        }
        return MaterialPageRoute(builder: (context) => const UnknownScreen());
      },
      // routes: {
      //   '/': (context) => HomeScreen(),
      //   '/profile': (context) => Profile(),
      // },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Program'),
        actions: [
          GestureDetector(
            child: const CircleAvatar(
              backgroundImage: AssetImage('assets/empty_profile.png'),
              radius: 10,
            ),
            onTap: () {
              Navigator.pushNamed(context, '/profile/1');
            },
          ),
        ],
      ),
      body: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);
  final nameController = TextEditingController();

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Welcome to Home Screen!'),
    );
  }
}

class UnknownScreen extends StatelessWidget {
  const UnknownScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('404!'),
      ),
    );
  }
}
