import 'package:flutter/material.dart';
import 'package:quotesapp/db/DBHelper.dart';
import 'package:quotesapp/models/Genre.dart';
import 'package:quotesapp/ui/IconThumbnail.dart';
import 'package:quotesapp/utils/functions.dart';

class TopicsList extends StatelessWidget {
  const TopicsList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: EdgeInsets.only(left: 10),
      child: FutureBuilder(
        future: _getTopics(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<Genre> genres = snapshot.data;
            return ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: genres.length,
              itemBuilder: (BuildContext context, int index) {
                return IconThumbnail(
                  name: capitalize(genres[index].name),
                  icon: Icons.favorite,
                  onPressed: () => print('icon pressed'),
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

  _getTopics() async {
    DBHelper db = new DBHelper();
    var genres = await db.getAllGenre(limit: 20);
    return genres;
  }
}
