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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: Offset(2.0, 1.0),
            blurRadius: 2.0,
            color: Colors.grey,
          ),
          BoxShadow(
            offset: Offset(3.0, 1.0),
            blurRadius: 3.0,
            color: Colors.grey[100],
          ),
        ],
      ),
      constraints: BoxConstraints(minHeight: 100, minWidth: 120),
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
