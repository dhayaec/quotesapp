import 'package:flutter/material.dart';
import 'package:quotesapp/ui/AuthorThumbnail.dart';
import 'package:quotesapp/ui/HomeBanner.dart';
import 'package:quotesapp/ui/IconThumbnail.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        HomeBanner(
          imageSrc: 'assets/authors/Lao-Tzu.jpg',
        ),
        AuthorThumbnail(
          imageSrc: 'assets/authors/Michael-Jordan.jpg',
          name: 'Winston Churchill',
          onPressed: () => print('author pressed'),
        ),
        IconThumbnail(
          name: 'Love',
          icon: Icons.favorite,
          onPressed: () => print('icon pressed'),
        )
      ],
    );
  }
}
