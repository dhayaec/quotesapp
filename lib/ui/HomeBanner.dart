import 'package:flutter/material.dart';

class HomeBanner extends StatelessWidget {
  final String imageSrc;

  HomeBanner({Key key, @required this.imageSrc});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 10,
      child: ClipRRect(
        child: Image.asset(imageSrc),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
