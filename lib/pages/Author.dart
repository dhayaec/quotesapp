import 'package:flutter/material.dart';

class Author extends StatelessWidget {
  final String imgSrc;
  final String name;

  Author({Key key, @required this.name, @required this.imgSrc});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  title: Text("$name",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(3.0, 1.0),
                            blurRadius: 3.0,
                            color: Colors.black,
                          ),
                          Shadow(
                            offset: Offset(3.0, 3.0),
                            blurRadius: 5.0,
                            color: Colors.black,
                          ),
                        ],
                      )),
                  background: Image.asset(
                    imgSrc,
                    fit: BoxFit.cover,
                  )),
            ),
          ];
        },
        body: Center(
          child: Text("$name"),
        ),
      ),
    );
  }
}
