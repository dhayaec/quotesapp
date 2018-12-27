import 'package:flutter/material.dart';
import 'package:quotesapp/utils/constants.dart';

class AuthorThumbnail extends StatelessWidget {
  final String imageSrc;
  final String name;
  final Function onPressed;

  AuthorThumbnail(
      {Key key,
      @required this.imageSrc,
      @required this.name,
      @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.6), BlendMode.dstATop),
            image: AssetImage(imageSrc),
            fit: BoxFit.cover,
          ),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment
                .topCenter, // 10% of the width, so there are ten blinds.
            colors: [
              Colors.black,
              Colors.transparent,
            ], // whitish to gray/ repeats the gradient over the canvas
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2,
              offset: Offset(2, 2),
            )
          ]),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: FlatButton(
            padding: EdgeInsets.all(0),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            splashColor: COLOR_SPLASH,
            onPressed: onPressed,
            child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '$name',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ))),
      ),
    );
  }
}
