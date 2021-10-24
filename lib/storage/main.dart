import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Using Shared Preferences',
      home: const SavingName(),
      routes: {
        '/namePage':(context)=>const PageWithName(),
      },
    );
  }
}

class SavingName extends StatefulWidget {
  const SavingName({Key key}) : super(key: key);

  @override
  _SavingNameState createState() => _SavingNameState();
}

class _SavingNameState extends State<SavingName> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to Program!'),
      ),
      body: ListView(
        children: [
          TextField(
            controller: controller,
          ),
          ElevatedButton(
            onPressed: () {
              saveName();
            },
            child: const Text('Add Name'),
          ),
        ],
      ),
    );
  }
  void saveName(){
    final name=controller.text;
    saveNamePreference(name).then((bool committed){
      Navigator.of(context).pushNamed('/namePage');
    });
  }
}

Future<bool> saveNamePreference(String name)async{
  final prefs = await SharedPreferences.getInstance();
  prefs.setString('name', name);
  return prefs.commit();
}

Future<String> getNamePreference()async{
  final prefs = await SharedPreferences.getInstance();
  final name=prefs.getString('name');
  return name;
}

class PageWithName extends StatefulWidget {
  const PageWithName({Key key}) : super(key: key);

  @override
  _PageWithNameState createState() => _PageWithNameState();
}

class _PageWithNameState extends State<PageWithName> {
  String name='';

  @override
  void initState() {
    getNamePreference().then(updateName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text('Your name is: $name'),
    );
  }

  void updateName(String name){
    setState(() {
      this.name=name;
    });
  }
}
