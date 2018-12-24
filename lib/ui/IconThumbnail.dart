import 'package:flutter/material.dart';
import 'package:quotesapp/utils/constants.dart';

class IconThumbnail extends StatelessWidget {
  final String name;
  final IconData icon;
  final Function onPressed;

  IconThumbnail(
      {Key key,
      @required this.icon,
      @required this.name,
      @required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(5),
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        splashColor: COLOR_SPLASH,
        onPressed: onPressed,
        color: Colors.white,
        padding: EdgeInsets.all(5),
        child: Column(
          children: <Widget>[
            Icon(
              icon,
              size: 60,
              color: Theme.of(context).accentColor,
            ),
            Text(
              "$name",
            )
          ],
        ),
      ),
    );
  }
}
