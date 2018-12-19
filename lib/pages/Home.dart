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
        appBar: AppBar(
          title: Text(APP_NAME),
        ),
        body: Column(
          children: <Widget>[
            HomeBanner(
              imageSrc: 'assets/authors/Michael-Jordan.jpg',
            ),
            AuthorThumbnail(
              imageSrc: 'assets/authors/Michael-Jordan.jpg',
              name: 'Winston Churchill',
              onPressed: () => print('author pressed'),
            ),
            IconThumbnail(
              name: 'Saint Patricks Day',
              icon: Icons.favorite,
              onPressed: () => print('icon pressed'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Author(
                            imgSrc: 'assets/authors/Michael-Jordan.jpg',
                            name: 'Micheal Jordan Quotes',
                          )),
                );
              },
              child: Text('Author'),
            )
          ],
        ));
  }
}
