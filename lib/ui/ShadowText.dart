import 'dart:ui';
import 'package:flutter/material.dart';

class ShadowText extends StatelessWidget {
  ShadowText(this.data,
      {this.style = const TextStyle(color: Colors.white, fontSize: 15)})
      : assert(data != null);

  final String data;
  final TextStyle style;

  Widget build(BuildContext context) {
    return ClipRect(
      child: Stack(
        children: [
          Positioned(
            top: 2.0,
            left: 2.0,
            child: Text(
              data,
              style: style.copyWith(color: Colors.black),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 1.0),
            child: Text(data, style: style),
          ),
        ],
      ),
    );
  }
}
