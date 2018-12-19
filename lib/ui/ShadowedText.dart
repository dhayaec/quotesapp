import 'package:flutter/material.dart';

class ShadowedText extends StatelessWidget {
  const ShadowedText({
    Key key,
    @required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text("$text",
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
          shadows: <Shadow>[
            Shadow(
              offset: Offset(0.0, 1.0),
              blurRadius: 1.0,
              color: Colors.grey,
            ),
            Shadow(
              offset: Offset(3.0, 3.0),
              blurRadius: 3.0,
              color: Colors.black54,
            ),
          ],
        ));
  }
}
