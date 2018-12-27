import 'package:flutter/material.dart';
import 'package:quotesapp/utils/page_transformers.dart';
import 'package:transformer_page_view/transformer_page_view.dart';

class AppPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Color> list = [
      Colors.redAccent,
      Colors.blueAccent,
      Colors.greenAccent
    ];
    return TransformerPageView(
        scrollDirection: Axis.vertical,
        transformer: ScaleAndFadeTransformer(scale: 0.9),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: list[index % list.length],
            child: Center(
              child: Text(
                "$index",
                style: TextStyle(fontSize: 80.0, color: Colors.white),
              ),
            ),
          );
        },
        itemCount: 10);
  }
}
