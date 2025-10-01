import 'package:flutter/material.dart';
import 'package:space/explore_button.dart';
import 'package:space/explore_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xff0E0E0E),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset("assets/images/home_page.png",
          width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
         ExploreButton(text: "Explore",
           action: (){
             Navigator.push(
                 context,
                 MaterialPageRoute(
                   builder: (context) => ExplorePage(),
                 )
             );
           }
         ),
          Container(
            alignment: Alignment.centerLeft,

            child: Text(" Explore\n The\n Universe "
              ,style:TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w900,
                color: Color(0xffffffff),

              ) ,),
          ),

        ],
      ),

    );
  }
}