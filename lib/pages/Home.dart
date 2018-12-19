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
          imageSrc: 'assets/authors/Ralph-Waldo-Emerson.jpg',
          name: 'Ralph-Waldo-Emerson',
        ),
        IconThumbnail(
          topicName: 'Love',
        )
      ],
    );
  }
}
