import 'package:flutter/material.dart';

class AuthorThumbnail extends StatelessWidget {
  final String imageSrc;
  final String name;

  AuthorThumbnail({Key key, @required this.imageSrc, @required this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          ClipRRect(
            child: Image.asset(
              imageSrc,
              width: 100,
              height: 100,
              fit: BoxFit.fitHeight,
            ),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('$name'),
          )
        ],
      ),
    );
  }
}
