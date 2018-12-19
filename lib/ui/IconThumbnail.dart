import 'package:flutter/material.dart';

class IconThumbnail extends StatelessWidget {
  final String topicName;
  IconThumbnail({Key key, @required this.topicName});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
      constraints: BoxConstraints(maxHeight: 100, maxWidth: 100),
      child: FittedBox(
        fit: BoxFit.contain,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.favorite,
              ),
              onPressed: () {},
            ),
            Text('$topicName')
          ],
        ),
      ),
    );
  }
}
