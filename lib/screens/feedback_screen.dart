import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/home_screen.dart';

class FeedbackScreen extends StatefulWidget {
  static const routeName = '/feedback';
  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _eamilFocusNode = FocusNode();
  final _massageFocusNode = FocusNode();
  Map<String, String> _feedback = {
    'name': '',
    'email': '',
    'massage': '',
  };

  @override
  void dispose() {
    _eamilFocusNode.dispose();
    _massageFocusNode.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    showCupertinoModalPopup(
      context: context,
      builder: (ctx) {
        return SimpleDialog(
          title: const Text('Thank you for your feedback and suggestions'),
          children: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).popAndPushNamed(HomeScreen.routeName);
              },
              child: const Text(
                'Done',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: const Text(
          'Aashayein',
          style: TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        height: deviceSize.height,
        width: deviceSize.width,
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        padding: const EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                child: const Text(
                  'Feedback & Suggestions',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 30),
              Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Your Name',
                        ),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(_eamilFocusNode);
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Enter your name';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _feedback['name'] = value;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Your Email',
                        ),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context)
                              .requestFocus(_massageFocusNode);
                        },
                        focusNode: _eamilFocusNode,
                        validator: (value) {
                          if (value.isEmpty || !value.contains('@')) {
                            return 'Invalid email!';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _feedback['email'] = value;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Massage',
                        ),
                        keyboardType: TextInputType.text,
                        focusNode: _massageFocusNode,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Enter your massage';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _feedback['massage'] = value;
                        },
                      ),
                      const SizedBox(height: 50),
                      Container(
                        height: 50,
                        width: double.infinity,
                        child: RaisedButton(
                          elevation: 0,
                          highlightElevation: 0,
                          color: Color.fromRGBO(0, 150, 136, 1),
                          onPressed: _submit,
                          child: const Text(
                            'Send Feedback',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          colorBrightness: Brightness.dark,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
