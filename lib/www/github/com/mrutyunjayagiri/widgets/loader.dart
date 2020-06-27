import 'package:flutter/material.dart';

class MyComponentsLoader extends StatelessWidget {
  final Color color;

  MyComponentsLoader({this.color});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator();
  }
}
