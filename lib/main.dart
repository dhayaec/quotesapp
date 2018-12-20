import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:quotesapp/db/DBHelper.dart';
import 'package:quotesapp/pages/Home.dart';
import 'package:quotesapp/utils/constants.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onTransition(Transition transition) {
    print(transition.toString());
  }
}

Future main() async {
  BlocSupervisor().delegate = SimpleBlocDelegate();

  DBHelper db = new DBHelper();
  var g = await db.getAllGenre();
  print(g.toString());

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
      home: Home(),
    );
  }
}
