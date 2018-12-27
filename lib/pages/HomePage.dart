import 'package:flutter/material.dart';
import 'package:quotesapp/components/AuthorsList.dart';
import 'package:quotesapp/components/QOD.dart';
import 'package:quotesapp/components/TopicsList.dart';
import 'package:quotesapp/pages/DetailPage.dart';
import 'package:quotesapp/ui/TitleSection.dart';
import 'package:quotesapp/utils/constants.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var txtTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            elevation: 0,
            leading: Icon(Icons.favorite),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                APP_NAME,
                style: TextStyle(
                    fontFamily: 'Chela One',
                    fontSize: txtTheme.headline.fontSize),
              ),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.notifications),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailPage()),
                  );
                },
              )
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              QOD(),
              TitleSection(
                buttonText: 'All Topics',
                onClick: () {},
                title: 'Topics',
              ),
              TopicsList(),
              TitleSection(
                buttonText: 'All Authors',
                onClick: () {},
                title: 'Authors',
              ),
              AuthorsList(),
            ]),
          )
        ],
      ),
    );
  }
}
