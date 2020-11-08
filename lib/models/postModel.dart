class Post{

  final String ownerId;
  final String postId;
  var accountPic;
  String accountName;
  String accountUsername;
  String date;
  String postText;
  String postPic;
//  List<String> postPic; //this variable to hold url
  String likes;
  List<Post> replies;

  Post({this.accountPic, this.accountName, this.accountUsername, this.ownerId, this.postId, this.date, this.postText, this.postPic, this.likes, this.replies});

}