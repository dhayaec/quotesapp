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
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
      constraints: BoxConstraints(maxHeight: 100, maxWidth: 100),
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        splashColor: COLOR_SPLASH,
        onPressed: onPressed,
        color: Colors.white,
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Icon(
              icon,
              size: 60,
              color: COLOR_PRIMARY,
            ),
            Text("$name")
          ],
        ),
      ),
    );
  }
}
