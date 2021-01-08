import 'package:Minders/components/constants.dart';
import 'package:Minders/controllers/mainBarController.dart';
import 'package:Minders/screens/home.dart';
import 'package:Minders/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:Minders/screens/about/about.dart';
import 'package:Minders/screens/contactUs.dart';
import 'package:get/get.dart';

class MainBar extends GetWidget<MainBarController> {
  @override
  Widget build(BuildContext context) {
    final tabs = [
      //events(),
      About(),
      Home(),
      //chat(),
      Profile(),
      ContactUs(),
    ];
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Center(
          child: Image.asset(
            'assets/images/Hlogo.png',
            fit: BoxFit.contain,
            height: 100,
            width: 100,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(40),
          ),
        ),
      ),
      body: Obx(() => tabs[controller.currentIndex]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          //iconSize: 30,
          //unselectedFontSize: 20,
          unselectedItemColor: Colors.white,
          selectedItemColor: mindersMainY,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.info),
                label: 'About',
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
                icon: Icon(Icons.call),
                label: 'Contact Us',
                backgroundColor: Colors.black),
          ],
          onTap: (index) {
            controller.userId.value = null;
            controller.changeIndex(index);
          },
        ),
      ),
    );
  }
}
