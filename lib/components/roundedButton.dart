import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton(
      {@required this.title,
      @required this.color,
      @required this.onPressed,
      this.borderColor: const Color(0xFF4E72E3),
      this.textColor: const Color(0xFFFFFFFF),
      this.minWidth :  200.0 ,
      this.height: 42.0
      }
      );
  final Color color;
  final String title;
  final Function onPressed;
  final Color borderColor;
  final Color textColor; 
  final double minWidth, height  ; 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Material(
          elevation: 0.0,
          color: color,
          borderRadius: BorderRadius.circular(30.0),
          child: MaterialButton(
            onPressed: onPressed,
            minWidth: minWidth,
            height: height,
            child: Text(
              title,
              style: TextStyle(color: textColor),
            ),
          ),
        ),
      ),
    );
  }
}
