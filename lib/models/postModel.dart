class Post{

  var accountPic;
  String accountName;
  String accountUsername;
  String date;
  String posText;
  String postPic;
//  List<String> postPic; //this variable to hold url
  String likes;
  List<Post> replies;

  Post({this.accountPic, this.accountName, this.accountUsername,this.date, this.posText, this.postPic, this.likes, this.replies});

}