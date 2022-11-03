import '../utils/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  var height;
  var width;
  String buttonText;
  Color color;

  CustomButton({
    required this.height,
    required this.width,
    required this.buttonText,
    required this.color
});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Text(
        "${buttonText}",
        style: TextStyle(
          color: textWhiteColor
        ),
      ),
    );
  }
}
