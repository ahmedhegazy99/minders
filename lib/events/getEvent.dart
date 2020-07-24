import 'dart:js_util';

class Event {
  String name;
  String description;
  String ticket_uri;

  Event(this.name, this.description, this.ticket_uri);
  
  Event.fromJson(Map<String, dynamic> json){
    name = json['name'];
    description = json['description'];
    ticket_uri = json['ticket_uri'];
  }
}