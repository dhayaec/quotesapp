import 'package:flutter/material.dart';
import 'package:quotesapp/pages/AuthorPage.dart';
import 'package:quotesapp/pages/DetailPage.dart';
import 'package:quotesapp/ui/AuthorThumbnail.dart';
import 'package:quotesapp/ui/HomeBanner.dart';
import 'package:quotesapp/ui/IconThumbnail.dart';
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
              Column(
                children: <Widget>[
                  HomeBanner(
                    imageSrc: 'assets/authors/Michael-Jordan.jpg',
                  ),
                ],
              ),
              TitleSection(
                buttonText: 'All Topics',
                onClick: () {},
                title: 'Topics',
              ),
              Container(
                height: 100,
                margin: EdgeInsets.only(left: 10),
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return IconThumbnail(
                      name: 'Saint Patrick day',
                      icon: Icons.favorite,
                      onPressed: () => print('icon pressed'),
                    );
                  },
                ),
              ),
              TitleSection(
                buttonText: 'All Authors',
                onClick: () {},
                title: 'Authors',
              ),
              Container(
                height: 100,
                margin: EdgeInsets.only(left: 10),
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return AuthorThumbnail(
                      imageSrc: 'assets/authors/Walt-Disney.jpg',
                      name: 'Albert Einstein',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AuthorPage(
                                    imgSrc:
                                        'assets/authors/George-Bernard-Shaw.jpg',
                                    name: 'George Bernard Shaw',
                                  )),
                        );
                      },
                    );
                  },
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
