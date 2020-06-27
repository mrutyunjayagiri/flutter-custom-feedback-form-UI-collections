import 'package:feedback_collection/www/github/com/mrutyunjayagiri/views/forms/form-three.dart';
import 'package:feedback_collection/www/github/com/mrutyunjayagiri/views/forms/form_four.dart';
import 'package:feedback_collection/www/github/com/mrutyunjayagiri/views/forms/form_one.dart';
import 'package:feedback_collection/www/github/com/mrutyunjayagiri/views/forms/form_two.dart';
import 'package:flutter/material.dart';

class MyHomeScreen extends StatefulWidget {
  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  PageController _pageController;
  int _totalPage = 4;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);

    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: <Widget>[FormOne(), FormTwo(), FormThree(), FormFour()],
      ),
    );
  }
}
