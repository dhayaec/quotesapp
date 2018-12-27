import 'dart:math';

import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:quotesapp/db/DBHelper.dart';
import 'package:quotesapp/models/Quote.dart';
import 'package:quotesapp/utils/constants.dart';
import 'package:quotesapp/utils/functions.dart';

class QOD extends StatelessWidget {
  const QOD({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bg = bgImages[randomInRange(1, bgImages.length - 1)];
    return FutureBuilder(
      future: _loadQOD(context),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          Quote quoteData = snapshot.data;
          return Container(
            width: double.infinity,
            height: 250,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5,
                  )
                ],
                image: DecorationImage(
                  image: AssetImage(bg),
                  fit: BoxFit.fill,
                )),
            child: Stack(
              children: <Widget>[
                Align(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Quote of the day',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  alignment: Alignment.topLeft,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 10, right: 10),
                    child: SizedBox(
                      width: double.infinity - 20,
                      height: 200,
                      child: AutoSizeText(quoteData.quote,
                          style: TextStyle(color: Colors.white, shadows: [
                            Shadow(
                                color: Colors.black,
                                offset: Offset(2, 2),
                                blurRadius: 2)
                          ]),
                          minFontSize: 10,
                          presetFontSizes: [40, 35, 30, 25, 20]),
                    ),
                  ),
                ),
                Align(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      quoteData.author,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  alignment: Alignment.bottomRight,
                )
              ],
            ),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  _loadQOD(BuildContext context) async {
    DBHelper db = new DBHelper();
    int count = await db.getQuotesCount();
    int qodId = randomInRange(1, count);
    return await db.getQuoteById(id: qodId);
  }
}
