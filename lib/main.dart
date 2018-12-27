import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:quotesapp/db/DBHelper.dart';
import 'package:quotesapp/pages/HomePage.dart';
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
  // var g = await db.getQuotes(page: 2, authorId: 7);
  var g = await db.getQuoteById(id: 1);
  print("${g.quote} ; ${g.favorite}, ${g.genre}");

  // var q = await db.getQuotes();
  // q.forEach((item) => print('${item.quote} - ${item.id}'));

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
      theme: ThemeData(primaryColor: Colors.deepPurple),
      title: APP_NAME,
      home: HomePage(),
    );
  }
}
