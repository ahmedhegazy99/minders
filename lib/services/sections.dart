import 'package:http/http.dart';
import 'dart:convert';

class Sections {

  String title; //name of section
  String description; //description about section
  String flag; //url to an asset flag image
  String url; //this is section url

  void getData() async {

    Response response = await get('http://www.mocky.io/v2/5ea68102320000841eac2a56');
    Map data = jsonDecode(response.body);
    print(data);
    print(data['title']);

    String title = data['title'];
    String description = data['description'];

    var section = List<Sections>();
  }
}