import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/services.dart';



import 'pages/account.dart';
import 'pages/booking.dart';
import 'pages/home.dart';
import 'pages/inbox.dart';
import 'pages/saved.dart';

import 'package:http/http.dart' as http;

class MyAppBTN extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'e-on BTN'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;
  int _selectedIndex = 0;
  final _layoutPage = [
    Home(),
    Saved(),
    Booking(),
    Inbox(),
    Account()
  ];

  void _onTabItem(int index){
    setState((){
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _layoutPage.elementAt(currentIndex),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: currentIndex,
        showElevation: true,
        itemCornerRadius: 8,
        curve: Curves.easeInBack,
        onItemSelected: (index) => setState(() {
          currentIndex = index;
        }),
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.apps, color: Colors.blue[700],),
            title: Text(
                'Dashboard',
                style: TextStyle(
                  color: Colors.red[900],
                  fontWeight: FontWeight.bold,
                )
            ),
            activeColor: Colors.amber,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.note, color: Colors.blue[700],),
            title: Text(
                'Notes',
                style: TextStyle(
                  color: Colors.red[900],
                  fontWeight: FontWeight.bold,
                )
            ),
            activeColor: Colors.amber,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.message, color: Colors.blue[700],),
            title: Text(
                'Messages',
                style: TextStyle(
                  color: Colors.red[900],
                  fontWeight: FontWeight.bold,
                )
            ),
            activeColor: Colors.amber,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.person, color: Colors.blue[700],),
            title: Text(
                'Profile',
                style: TextStyle(
                  color: Colors.red[900],
                  fontWeight: FontWeight.bold,
                )
            ),
            activeColor: Colors.amber,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
