import 'package:flutter/material.dart';
import 'package:minders/about.dart';
import 'package:minders/chat.dart';
import 'package:minders/contactUs.dart';
import 'package:minders/events.dart';
import 'package:minders/home.dart';

class mainBar extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<mainBar> {

  int _currentIndex = 2;

  final tabs = [
    events(),
    about(),
    home(),
    chat(),
    contactUs(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
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
        selectedItemColor: Colors.yellow,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.event),
              title: Text('Events'),
              backgroundColor: Colors.black
          ),
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
          BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble),
              title: Text('Chat'),
              backgroundColor: Colors.black
          ),
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