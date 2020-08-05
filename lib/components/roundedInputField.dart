import 'package:Minders/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final Color color;
  final Color textColor;
  final FormFieldValidator<String> validator;
  final ValueChanged<String> onChanged;
  final bool obscureText;
  final TextInputType keyboardType;

  RoundedInputField({
    Key key,
    this.color = Colors.white,
    this.textColor = Colors.black,
    this.hintText,
    this.icon ,
    this.validator,
    this.onChanged,
    this.obscureText = false,
    this.keyboardType
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 1),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextFormField(
        validator: validator,
        onChanged: onChanged,
        cursorColor: mindersDarkY,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: textColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
        style: TextStyle(color: textColor,),
        obscureText: true,
      ),

    );
  }
}