import 'package:flutter/material.dart';
import 'package:quotesapp/db/DBHelper.dart';
import 'package:quotesapp/models/Author.dart';
import 'package:quotesapp/pages/AuthorPage.dart';
import 'package:quotesapp/ui/AuthorThumbnail.dart';
import 'package:quotesapp/utils/functions.dart';

class AuthorsList extends StatelessWidget {
  const AuthorsList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: EdgeInsets.only(left: 10),
      child: FutureBuilder(
        future: _getAuthors(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<Author> data = snapshot.data;
            return ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return AuthorThumbnail(
                  imageSrc:
                      'assets/authors/' + slugify(data[index].name) + '.jpg',
                  name: data[index].name,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AuthorPage(
                                imgSrc: 'assets/authors/' +
                                    slugify(data[index].name) +
                                    '.jpg',
                                name: data[index].name,
                                authorId: data[index].id,
                              )),
                    );
                  },
                );
              },
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }

  _getAuthors() async {
    DBHelper db = new DBHelper();
    var authors = await db.getAllAuthors(isPopular: 1);
    return authors;
  }
}
