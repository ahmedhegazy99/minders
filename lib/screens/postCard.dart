import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Minders/models/postModel.dart';

class PostCard extends StatefulWidget {
  final PostModel posts;
  PostCard({this.posts});

  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  int upButton = 0;
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Card(
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
      shape: RoundedRectangleBorder(
          //borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0),)
          borderRadius: BorderRadius.all(
        Radius.circular(30.0),
      )),
      child: Column(
        children: [
          //post info container
          Container(
            padding: EdgeInsets.only(
              top: 5,
            ),
            child: ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.grey[200],
                backgroundImage: NetworkImage(widget.posts.userImage),
              ),
              title: Row(
                children: [
                  //account name text
                  Text(
                    widget.posts.userName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.25,
                  ),
                  //post date text
                  Text(
                    widget.posts.text,
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        color: Colors.black38),
                  ),
                ],
              ),
              //account username text
              subtitle: Text(widget.posts.userName),

              //options button (the arrow on the right)
              trailing: GestureDetector(
                child: Icon(Icons.keyboard_arrow_down),
                onTap: () {},
              ),
            ),
          ),

          //post text
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
            child: Text(widget.posts.text),
          ),

          //post image
          Container(
            //this function returns an image asset child to the container if
            // there is image if no image provided it returns null without errors
            child: (() {
              if (widget.posts.contentUrl != null)
                return Image.asset(widget.posts.contentUrl);
              else
                return null;
            }()),
            //Placeholder(fallbackWidth: size.width, fallbackHeight: size.height * 0.3,),
          ),

          //actions part up button and comment button
          Container(
            padding: EdgeInsets.symmetric(horizontal: 0),
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // up button
                FlatButton.icon(
                  icon: Icon(Icons.arrow_upward),
                  label: Text(upButton.toString()),
                  textColor: pressed ? Colors.yellow : Colors.black38,
                  onPressed: () {
                    setState(() {
                      if (!pressed) {
                        upButton++;
                        pressed = true;
                      } else {
                        upButton--;
                        pressed = false;
                      }
                    });
                  },
                ),

                //comment button
                FlatButton.icon(
                    icon: Icon(Icons.mode_comment),
                    label: Text(upButton.toString()),
                    textColor: Colors.black38,
                    onPressed: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
