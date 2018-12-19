import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:quotesapp/pages/Home.dart';
import 'package:quotesapp/utils/constants.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onTransition(Transition transition) {
    print(transition.toString());
  }
}

void main() {
  BlocSupervisor().delegate = SimpleBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: APP_NAME,
      home: Scaffold(
        appBar: AppBar(
          title: Text(APP_NAME),
        ),
        body: Home(),
      ),
    );
  }
}
