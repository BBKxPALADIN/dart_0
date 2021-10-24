import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Example of File Storage',
      home: WelcomeApp(),
    );
  }
}

class WelcomeApp extends StatefulWidget {
  const WelcomeApp({Key key}) : super(key: key);


  @override
  _WelcomeAppState createState() => _WelcomeAppState();
}

class _WelcomeAppState extends State<WelcomeApp> {
  String data='';

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    // For your reference print the AppDoc directory
    print(directory.path);
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/data.txt');
  }

  Future<File> writeContent() async {
    final file = await _localFile;
    return file.writeAsString('Hello Friends. My name is Bekzod!!!');
  }

  Future<String> readContent() async {
    try {
      final file = await _localFile;

      //Read th File
      final contents = await file.readAsString();
      return Future.delayed(const Duration(microseconds: 10000),(){
        return contents;
      });
    } catch (e) {
      return 'Error!';
    }
  }

  @override
  void initState() {
    super.initState();
    writeContent();
    readContent().then((value) {
      setState(() {
        data = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My App'),
      ),
      body: Center(
        child: Text(data),
      ),
    );
  }
}
