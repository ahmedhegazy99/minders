import 'package:Minders/components/constants.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Widget icon;
  int viewIcon;
  final Function press;
  final Color color, textColor;
  //const RoundedButton({
  RoundedButton({
    Key key,
    this.text,
    this.icon,
    this.viewIcon = 0,
    this.press,
    this.color = mindersMainY,
    this.textColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if(icon != null){
      viewIcon = 1;
    }
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          color: color,
          onPressed: press,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              //SizedBox(height: size.height * 0.05),

              Container(
                  width: size.width * 0.1 * viewIcon,
                  child: icon
              ),

              Text(
                text,
                style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "englishBebas", color: textColor, fontSize: 32),
              ),
            ],
          ),
        ),
      ),
    );
  }
}