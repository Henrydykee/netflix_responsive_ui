import 'package:flutter/material.dart';

class VerticalButtons extends StatelessWidget {
  final IconData icon;
  final String title;

  VerticalButtons({this.icon, this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.white,),
        SizedBox(height: 2.0,),
        Text(title, style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600
        ),)
      ],
    );
  }
}
