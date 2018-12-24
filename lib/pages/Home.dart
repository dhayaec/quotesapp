import 'package:flutter/material.dart';
import 'package:quotesapp/pages/Author.dart';
import 'package:quotesapp/ui/AuthorThumbnail.dart';
import 'package:quotesapp/ui/HomeBanner.dart';
import 'package:quotesapp/ui/IconThumbnail.dart';
import 'package:quotesapp/utils/constants.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            leading: Icon(Icons.favorite),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(APP_NAME),
            ),
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
              Container(
                margin: EdgeInsets.only(left: 10, top: 10, right: 10),
                child: Flex(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Topics', style: Theme.of(context).textTheme.title),
                    FlatButton(
                      child: Text(
                        'All Topics',
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                      onPressed: () {},
                      padding: EdgeInsets.all(0),
                    )
                  ],
                  direction: Axis.horizontal,
                ),
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
            ]),
          )
        ],
      ),
    );
  }
}
