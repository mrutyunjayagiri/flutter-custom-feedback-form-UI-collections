import 'package:feedback_collection/www/github/com/mrutyunjayagiri/views/home_view.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  void onStart(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => MyHomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
              child: Center(
                  child: Text(
            "Feedback Form Collection",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 55.0, fontWeight: FontWeight.bold),
          ))),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.maxFinite,
              child: RaisedButton.icon(
                  onPressed: () => onStart(context),
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  icon: Icon(Icons.arrow_forward),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  label: Text("START SLIDES")),
            ),
          )
        ],
      ),
    );
  }
}
