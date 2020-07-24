import 'package:flutter/material.dart';

class events extends StatefulWidget {
  @override
  _eventsState createState() => _eventsState();
}

class _eventsState extends State<events> {

  Future fetchNotes() async {
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: <Widget>[
                Text("Event Title"),
                Text("description"),
              ],
            ),
          );
        }, //itemCount: 50,
      ),
    );
  }
}
