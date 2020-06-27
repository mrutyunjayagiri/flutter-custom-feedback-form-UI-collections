import 'package:feedback_collection/www/github/com/mrutyunjayagiri/utils/validator.dart';
import 'package:feedback_collection/www/github/com/mrutyunjayagiri/widgets/loader.dart';
import 'package:flutter/material.dart';

class FormOne extends StatefulWidget {
  @override
  _FeedbackFormScreenState createState() => _FeedbackFormScreenState();
}

class _FeedbackFormScreenState extends State<FormOne> with Validator {
  final TextEditingController _messageController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  final double _minValue = 8.0;
  bool isLoading = false;
  bool hasError = false;
  String message = "";

  String _feedbackType = 'COMMENT';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextStyle _errorStyle = TextStyle(
    color: Colors.red,
    fontSize: 16.6,
  );

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  Future<bool> _onBackTap() async {
    Navigator.of(context).pop();
    return true;
  }

  Widget _buildFirstName() {
    return TextFormField(
      controller: _firstNameController,
      validator: usernameValidator,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          errorStyle: _errorStyle,
          border: OutlineInputBorder(),
          contentPadding:
              EdgeInsets.symmetric(vertical: _minValue, horizontal: _minValue),
          labelText: 'First Name',
          hintText: 'First Name',
          labelStyle: TextStyle(fontSize: 16.0, color: Colors.black87)),
    );
  }

  Widget _buildLastName() {
    return TextFormField(
      controller: _lastNameController,
      validator: usernameValidator,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          errorStyle: _errorStyle,
          border: OutlineInputBorder(),
          contentPadding:
              EdgeInsets.symmetric(vertical: _minValue, horizontal: _minValue),
          hintText: 'Last Name',
          labelText: 'Last Name',
          labelStyle: TextStyle(fontSize: 16.0, color: Colors.black87)),
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.text,
      validator: validateEmail,
      onChanged: (String value) {},
      readOnly: true,
      decoration: InputDecoration(
          errorStyle: _errorStyle,
          border: OutlineInputBorder(),
          contentPadding:
              EdgeInsets.symmetric(vertical: _minValue, horizontal: _minValue),
          labelText: 'Email',
          labelStyle: TextStyle(fontSize: 16.0, color: Colors.black87)),
    );
  }

  Widget _buildDescription() {
    return TextFormField(
      controller: _messageController,
      keyboardType: TextInputType.text,
      maxLines: 2,
      decoration: InputDecoration(
          errorStyle: _errorStyle,
          labelText: 'Description',
          border: OutlineInputBorder(),
          contentPadding:
              EdgeInsets.symmetric(vertical: _minValue, horizontal: _minValue),
          labelStyle: TextStyle(fontSize: 16.0, color: Colors.black87)),
    );
  }

  Widget _buildFeedbackType() {
    return Row(
      children: <Widget>[
        Radio<String>(
            value: 'COMMENT',
            groupValue: _feedbackType,
            onChanged: (String v) {
              setState(() {
                _feedbackType = v;
              });
            }),
        Text('Comments'),
        SizedBox(
          width: _minValue,
        ),
        Radio<String>(
            value: 'BUG',
            groupValue: _feedbackType,
            onChanged: (String v) {
              setState(() {
                _feedbackType = v;
              });
            }),
        Text('Bug Reports'),
        SizedBox(
          width: _minValue,
        ),
        Radio<String>(
            value: 'QUESTION',
            groupValue: _feedbackType,
            onChanged: (String v) {
              setState(() {
                _feedbackType = v;
              });
            }),
        Text('Questiions')
      ],
    );
  }

  Widget _buildSubmitBtn() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: _minValue * 3),
      child: RaisedButton(
        onPressed: () => null,
        padding: EdgeInsets.symmetric(vertical: _minValue * 2),
        elevation: 0.0,
        color: Theme.of(context).primaryColor,
        textColor: Colors.white,
        child: Text('SAVE'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackTap,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text("Feedback"),
          centerTitle: true,
        ),
        backgroundColor: Colors.grey[50],
        body: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: _minValue * 2, vertical: _minValue * 3),
              child: Text(
                "We would love to hear your thoughts, concerns and problem with anything, so we can improve.",
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              padding: EdgeInsets.all(_minValue * 2),
              child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Feedback Type"),
                      _buildFeedbackType(),
                      SizedBox(
                        height: _minValue * 3,
                      ),
                      _buildFirstName(),
                      SizedBox(
                        height: _minValue * 3,
                      ),
                      _buildLastName(),
                      SizedBox(
                        height: _minValue * 3,
                      ),
                      _buildEmail(),
                      SizedBox(
                        height: _minValue * 3,
                      ),
                      _buildDescription(),
                      SizedBox(
                        height: _minValue * 3,
                      ),
                      SizedBox(
                        height: _minValue * 4,
                      ),
                    ],
                  )),
            ),
            isLoading ? MyComponentsLoader() : _buildSubmitBtn()
          ],
        ),
      ),
    );
  }
}
