import 'package:Minders/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:Minders/models/postModel.dart';
import 'package:Minders/screens/postCard.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {

  List<String> replies = [
    "https://picsum.photos/200/300"
  ];

  List<Post> timeline = [
    Post(accountPic: "https://picsum.photos/200/300" ,accountName: "Minders", accountUsername: "@minders_fci", date: "23 Jul", posText: "This is a test text for our application helping in performing better view for developing it. This is a test text for our application helping in performing better view for developing it. This is a test text for our application helping in performing better view for developing it.", likes: "10", postPic: "assets/images/screenshot.png"),
    Post(accountPic: "https://picsum.photos/200/400" ,accountName: "Minders", accountUsername: "@minders_fci", date: "23 Jul", posText: "This is a test text for our application helping in performing better view for developing it.", likes: "10", /*postPic: "assets/images/screenshot.png"*/),
    Post(accountPic: "https://picsum.photos/200/300" ,accountName: "Minders", accountUsername: "@minders_fci", date: "23 Jul", posText: "This is a test text for our application helping in performing better view for developing it.", likes: "10", postPic: "assets/images/screenshot.png"),
    Post(accountPic: "https://picsum.photos/200/500" ,accountName: "Minders", accountUsername: "@minders_fci", date: "23 Jul", posText: "This is a test text for our application helping in performing better view for developing it.", likes: "10", postPic: "assets/images/screenshot.png"),
    Post(accountPic: "https://picsum.photos/200/300" ,accountName: "Minders", accountUsername: "@minders_fci", date: "23 Jul", posText: "This is a test text for our application helping in performing better view for developing it.", likes: "10", postPic: "assets/images/screenshot.png"),
    Post(accountPic: "https://picsum.photos/200/200" ,accountName: "Minders", accountUsername: "@minders_fci", date: "23 Jul", posText: "This is a test text for our application helping in performing better view for developing it.", likes: "10", postPic: "assets/images/screenshot.png"),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[200],
        child: ListView.builder(
          itemCount: timeline.length,
          itemBuilder: (context, index){
            return Container(
              child: PostCard(posts: timeline[index],),
            );
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        tooltip: "Create Post",
        child: Icon(Icons.add, color: Colors.black,),
        backgroundColor: mindersMainY,
        onPressed: (){

        },
      ),

    );
  }
}