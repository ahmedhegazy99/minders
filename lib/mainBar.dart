import 'package:Minders/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:Minders/screens/about/about.dart';
import 'package:Minders/screens/chat.dart';
import 'package:Minders/screens/contactUs.dart';
import 'package:Minders/screens/events.dart';
import 'package:Minders/screens/home.dart';

class mainBar extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<mainBar> {

  int _currentIndex = 1; //this is = 2 to make the third item in the navigation bar default

  final tabs = [
    //events(),
    about(),
    home(),
    //chat(),
    contactUs(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Center(child: Image.asset(
          'assets/images/Hlogo.png',
          fit: BoxFit.contain,
          height: 100,
          width: 100,
        ),
        ),
        centerTitle: true,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(40),
          ),
        ),
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        //iconSize: 30,
        //unselectedFontSize: 20,
        unselectedItemColor: Colors.white,
        selectedItemColor: mindersMainY,
        items: [
          /*BottomNavigationBarItem(
              icon: Icon(Icons.event),
              title: Text('Events'),
              backgroundColor: Colors.black
          ),*/
          BottomNavigationBarItem(
              icon: Icon(Icons.info),
              title: Text('About'),
              backgroundColor: Colors.black
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              backgroundColor: Colors.black
          ),
          /*BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble),
              title: Text('Chat'),
              backgroundColor: Colors.black
          ),*/
          BottomNavigationBarItem(
              icon: Icon(Icons.call),
              title: Text('Contact Us'),
              backgroundColor: Colors.black
          ),
        ],
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}