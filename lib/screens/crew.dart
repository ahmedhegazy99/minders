import 'package:flutter/material.dart';

class Crew extends StatefulWidget {
  @override
  _CrewState createState() => _CrewState();
}

class _CrewState extends State<Crew> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Meet Our Crew"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                children: <Widget>[
                  Text("title"),
                  Text("description"),
                ],
              ),
            );
          },
        //itemCount: 50,
      ),
    );
  }
}
