import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget {
  final String title;
  final String buttonText;
  final Function onClick;

  const TitleSection(
      {Key key,
      @required this.title,
      @required this.buttonText,
      @required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, top: 10, right: 10),
      child: Flex(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(title, style: Theme.of(context).textTheme.title),
          FlatButton(
            child: Text(
              buttonText,
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            onPressed: onClick,
            padding: EdgeInsets.all(0),
          )
        ],
        direction: Axis.horizontal,
      ),
    );
  }
}
