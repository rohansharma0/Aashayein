import '../screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';
import '../screens/feedback_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: statusBarHeight),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(left: 15),
                alignment: Alignment.centerLeft,
                width: double.infinity,
                height: 60,
                child: const Text(
                  'Aashayein',
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Divider(),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                child: const Text(
                  'Contact Us',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Divider(),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                child: const Text(
                  'Phone : +917003914706',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              Divider(),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                child: const Text(
                  'Email : aashayeinwork@gmail.com',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              Divider(),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed(FeedbackScreen.routeName);
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(15),
                  child: const Text(
                    'Feedback & Suggestions',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.black.withOpacity(0.05),
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                child: const Text(
                  'Connect with Us',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                color: Colors.black.withOpacity(0.05),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(15),
                          child: const Text(
                            'Facebook',
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(15),
                          child: const Text(
                            'Instagram',
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(15),
                          child: const Text(
                            'Twitter',
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              Container(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                    Provider.of<Auth>(context, listen: false).logout();
                    Navigator.of(context)
                        .popAndPushNamed(LoginScreen.routeName);
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    child: const Text(
                      'Log out',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                    ),
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
