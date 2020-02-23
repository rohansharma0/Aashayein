import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/food_screen.dart';
import '../widgets/main_drawer.dart';

class PopupMenu {
  static const String about = 'About Us';
  static const String policy = 'Privacy Policy';
  static const String terms = 'Terms & Conditions';

  static const List<String> choices = [about, policy, terms];
}

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  void choiceSelected(String choice, BuildContext context) {
    if (choice == PopupMenu.about) {
      showAboutDialog(
        context: context,
        applicationName: 'Aashayein',
        children: [
          const Text(
              'Aashayein strives to make sure that every soul gets fed and furnished and we make sure every unfortunate from now on, doesn\'t get called so ever in their lives.Unfazed and unperturbed are our visions, to make our environment a waste-free one. Help us achieve this dream one day at a time')
        ],
      );
    } else if (choice == PopupMenu.policy) {
      showLicensePage(
        context: context,
        applicationName: 'Aashayein',
        applicationVersion: '1.1',
      );
    } else if (choice == PopupMenu.terms) {
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
  }

  @override
  Widget build(BuildContext context) {
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
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (c) => choiceSelected(c, context),
            itemBuilder: (BuildContext ctx) {
              return PopupMenu.choices.map((String choice) {
                return PopupMenuItem(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 20,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(FoodScreen.routeName, arguments: 'Food');
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/food.jpg',
                      fit: BoxFit.cover,
                      height: 200,
                      width: double.infinity,
                    ),
                    Positioned.fill(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 1,
                          sigmaY: 1,
                        ),
                        child: Container(
                          color: Colors.black.withOpacity(0.4),
                        ),
                      ),
                    ),
                    Center(
                      child: const Text(
                        'FOOD',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 20,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(FoodScreen.routeName, arguments: 'Cloth');
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/cloth.jpg',
                      fit: BoxFit.cover,
                      height: 200,
                      width: double.infinity,
                    ),
                    Positioned.fill(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 1,
                          sigmaY: 1,
                        ),
                        child: Container(
                          color: Colors.black.withOpacity(0.4),
                        ),
                      ),
                    ),
                    Center(
                      child: const Text(
                        'CLOTHING',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 20,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(FoodScreen.routeName, arguments: 'Stationary');
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/books.jpg',
                      fit: BoxFit.cover,
                      height: 200,
                      width: double.infinity,
                    ),
                    Positioned.fill(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 1,
                          sigmaY: 1,
                        ),
                        child: Container(
                          color: Colors.black.withOpacity(0.4),
                        ),
                      ),
                    ),
                    Center(
                      child: const Text(
                        'STATIONERY',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 20,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(FoodScreen.routeName, arguments: 'Others');
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/other.jpg',
                      fit: BoxFit.cover,
                      height: 200,
                      width: double.infinity,
                    ),
                    Positioned.fill(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 1,
                          sigmaY: 1,
                        ),
                        child: Container(
                          color: Colors.black.withOpacity(0.4),
                        ),
                      ),
                    ),
                    Center(
                      child: const Text(
                        'OTHERS',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: MainDrawer(),
      ),
      drawerScrimColor: Colors.black45,
    );
  }
}
