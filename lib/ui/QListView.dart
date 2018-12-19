import 'package:flutter/material.dart';

class QListView extends StatelessWidget {
  final items = List<String>.generate(
      100,
      (i) =>
          "This is a sample quote from some author $i Some more text also added to show two lines");

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          contentPadding: EdgeInsets.all(5),
          title: Text('${items[index]}'),
          subtitle: Align(
              alignment: Alignment.bottomRight, child: Text('-- Author Name')),
        );
      },
    );
  }
}
