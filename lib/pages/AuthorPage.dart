import 'package:flutter/material.dart';
import 'package:quotesapp/ui/QListView.dart';

class AuthorPage extends StatelessWidget {
  final String imgSrc;
  final String name;

  AuthorPage({Key key, @required this.name, @required this.imgSrc});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.favorite),
                    onPressed: () {},
                  )
                ],
                flexibleSpace: FlexibleSpaceBar(
                    title: Text(name + ' Quotes'),
                    background: Image.asset(
                      imgSrc,
                      fit: BoxFit.cover,
                    )),
              ),
            ];
          },
          body: QListView()),
    );
  }
}
