import 'package:flutter/material.dart';

class DetailsText extends StatelessWidget {
  String text;
  DetailsText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: Colors.white,
      fontFamily: "SpaceGrotesk",
    ),

    );
  }
}
