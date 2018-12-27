import 'package:flutter/material.dart';
import 'package:quotesapp/ui/QListView.dart';
import 'package:quotesapp/ui/ShadowedText.dart';

class GenrePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  floating: false,
                  pinned: true,
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(Icons.favorite),
                      onPressed: () {},
                    )
                  ],
                  flexibleSpace:
                      FlexibleSpaceBar(title: ShadowedText(text: 'Genre')),
                ),
              ];
            },
            body: QListView()));
  }
}
