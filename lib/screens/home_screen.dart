import 'package:flutter/material.dart';
import 'package:space/core/constants.dart';
import 'package:space/widgets/explore_button.dart';
import 'package:space/screens/explore_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            "assets/images/home_page.png",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          ExploreButton(
            text: "Explore",
            action: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ExplorePage()),
              );
            },
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: const Text(
              " Explore\n The\n Universe ",
              style: AppTextStyles.header,
            ),
          ),
        ],
      ),
    );
  }
}
