import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Minders/models/postModel.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class PostCard extends StatelessWidget {
  final PostModel post;
  PostCard({this.post});

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
          Container(
            padding: EdgeInsets.only(
              top: 5,
            ),
            child: ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.grey[200],
                backgroundImage: NetworkImage(post.userImage ??
                    'https://upload.wikimedia.org/wikipedia/commons/8/89/Portrait_Placeholder.png'),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //account name text
                  Text(
                    post.userName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),

                  //post date text
                  Text(
                    DateFormat.yMEd().format(post.date),
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        color: Colors.black38),
                  ),
                ],
              ),
              //     //account username text
              subtitle: Text('@${post.userName}'),

              //     //options button (the arrow on the right)
              trailing: GestureDetector(
                child: Icon(Icons.keyboard_arrow_down),
                onTap: () {},
              ),
            ),
          ),
          // //post text
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
            child: Text(post.text),
          ),

          // post image
          if (post.type == PostTypeEnum.photo && post.contentUrl != null)
            Container(
              child: Image.network(post.contentUrl),
            ),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 0),
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FlatButton.icon(
                  icon: Icon(Icons.arrow_upward),
                  label: Text('upvote'.tr),
                  textColor: Colors.black38,
                  onPressed: () {},
                ),
                FlatButton.icon(
                    icon: Icon(Icons.mode_comment),
                    label: Text('comment'.tr),
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
