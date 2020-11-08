import 'package:Minders/authenticate/login.dart';
import 'package:Minders/mainBar.dart';
import 'package:Minders/models/user.dart';
import 'package:Minders/screens/home.dart';
import 'package:Minders/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {


  handleAuth(){
    return StreamBuilder(
        stream: _auth.onAuthStateChanged,
        builder: (BuildContext context, snapshot){
          if(snapshot.hasData){
            return mainBar();
          }else{
            return Login();
          }
        });
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future getUserId() async {
    FirebaseUser user = await _auth.currentUser();
    final userid = user.uid;
    return userid;
  }

  
  //create user object based on firebase user
  User _userFromFirebaseUser(FirebaseUser user){
    return user != null ? User(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
      //.map((FirebaseUser user) => _userFromFirebaseUser(user));
      .map(_userFromFirebaseUser);
  }


  //sign in  anon
  /*Future signInAnon() async {
    try{
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e){
      print(e.toString());
      return null;
    }
  }*/

  //sign in with email and password
  Future emailSignin(String email, String pass) async {
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: pass);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //register with email and password
  Future emailSignup(String firstName, String lastName, String email, String mobile, String password) async {
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;

      //create a new document for new user with uid
      await DatabaseService(uid: user.uid).updateUserData(firstName, lastName, email, mobile, password);

      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async {
    try{
      return await _auth.signOut();
    } catch(e){
      print(e.toString());
      return null;
    }
  }

}
