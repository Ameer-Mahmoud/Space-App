import 'package:flutter/material.dart';

import 'explore_page.dart';


class ExploreButton extends StatelessWidget {

  String text;
  VoidCallback  action;
  ExploreButton({required this.text,required this.action});


  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 22),

        child: InkWell(
          onTap: action ,
          child: Container(

            margin: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            padding: EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 24,
            ),
            decoration: BoxDecoration(
              color: Color(0xffEE403D),
              borderRadius: BorderRadius.circular(29),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                Icon(Icons.arrow_right_alt_rounded, color: Color(0xffffffff),)],
            ),
          ),
        ),
      ),
    );
  }
}
