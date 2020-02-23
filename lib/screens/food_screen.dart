import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/home_screen.dart';

class FoodScreen extends StatefulWidget {
  static const routeName = '/food';
  @override
  _FoodScreenState createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  final _numberFocusNode = FocusNode();
  final _discriptionFocusNode = FocusNode();

  @override
  void dispose() {
    _numberFocusNode.dispose();
    _discriptionFocusNode.dispose();
    super.dispose();
  }

  final GlobalKey<FormState> _formKey = GlobalKey();
  Map<String, String> _donationData = {
    'fullname': '',
    'address': '',
    'discription': '',
    'phone': '',
  };
  var _isLoading = false;
  var _isCheck = false;

  void _showTermsAndCondition() {
    showCupertinoModalPopup(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Terms and Conditions'),
        content: const Text(
            '1. Anything donated, is not eligible for cancellation anymore.\n2. Any person/s trying to surf this app/contact us, MUST be 18 or above.\n3. A negligible amount of money would be charged by us for the transfer of every transaction of money.\n**By clicking continue, you agree to our terms and conditions.'),
        actions: <Widget>[
          FlatButton(
            child: const Text('Exit'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  Future<void> _donate() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });
    try {
      showCupertinoModalPopup(
        context: context,
        builder: (ctx) {
          return SimpleDialog(
            title: const Text(
              "Sir/ma\'am, we are extremely grateful for your donation. We are currently reconnecting it to a NGO.\nWait for 5 mins.",
              style: TextStyle(fontSize: 14),
            ),
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).popAndPushNamed(HomeScreen.routeName);
                },
                child: const Text(
                  'Done',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            ],
          );
        },
      );
    } catch (error) {
      throw error;
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final title = ModalRoute.of(context).settings.arguments as String;

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
        padding: const EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Your Full Name',
                        ),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(_numberFocusNode);
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Enter your name';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _donationData['fullname'] = value;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Phone Number',
                        ),
                        keyboardType: TextInputType.number,
                        focusNode: _numberFocusNode,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context)
                              .requestFocus(_discriptionFocusNode);
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Enter your number';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _donationData['phone'] = value;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: '$title discription',
                        ),
                        maxLines: 3,
                        keyboardType: TextInputType.multiline,
                        focusNode: _discriptionFocusNode,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Enter food discription';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _donationData['discription'] = value;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Your Address',
                        ),
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Enter your address';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _donationData['address'] = value;
                        },
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Checkbox(
                            value: _isCheck,
                            onChanged: (value) {
                              setState(() {
                                _isCheck = !_isCheck;
                              });
                            },
                          ),
                          FlatButton(
                            onPressed: _showTermsAndCondition,
                            child: const Text('Terms and Conditions'),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                        child: const Text(
                            '*This will send your current loction!!'),
                      ),
                      const SizedBox(height: 20),
                      (_isLoading)
                          ? const CircularProgressIndicator()
                          : Container(
                              height: 50,
                              width: double.infinity,
                              child: RaisedButton(
                                elevation: 0,
                                highlightElevation: 0,
                                color: Color.fromRGBO(0, 150, 136, 1),
                                onPressed: (_isCheck) ? _donate : null,
                                child: const Text(
                                  'Submit',
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
