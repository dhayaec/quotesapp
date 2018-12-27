import 'package:flutter/material.dart';
import 'package:quotesapp/db/DBHelper.dart';
import 'package:quotesapp/models/Quote.dart';

class AuthorPage extends StatelessWidget {
  final String imgSrc;
  final String name;
  final int authorId;

  AuthorPage(
      {Key key,
      @required this.name,
      @required this.imgSrc,
      @required this.authorId});
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
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.favorite),
                    onPressed: () {},
                  )
                ],
                flexibleSpace: FlexibleSpaceBar(
                    title: Text(name + ' Quotes'),
                    background: Image.asset(
                      imgSrc,
                      fit: BoxFit.cover,
                    )),
              ),
            ];
          },
          body: FutureBuilder(
            future: _getQuotesByAuthor(authorId),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                List<Quote> data = snapshot.data;
                return ListView.separated(
                  itemBuilder: (context, index) {
                    return ListTile(
                      contentPadding: EdgeInsets.all(10),
                      title: Text('${data[index].quote}'),
                    );
                  },
                  itemCount: data.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      height: 2,
                      width: double.infinity,
                      color: Colors.black12,
                    );
                  },
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          )),
    );
  }

  _getQuotesByAuthor(int authorId) async {
    DBHelper db = new DBHelper();
    var authors = await db.getQuotes(authorId: authorId, limited: false);
    return authors;
  }
}
