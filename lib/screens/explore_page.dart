import 'package:flutter/material.dart';
import 'package:space/core/constants.dart';
import 'package:space/data/planet_data.dart';
import 'package:space/screens/detail_page.dart';
import 'package:space/widgets/explore_button.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Stack(
            children: [
              Image.asset("assets/images/upper.png"),
              Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      AppColors.background.withOpacity(0.8),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: SizedBox(
              width: 342,
              height: 339,
              child: PageView.builder(
                controller: _pageController,
                itemCount: planets.length,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Image.asset(planets[index].image);
                },
              ),
            ),
          ),
          ExploreButton(
            text: "Explore ${planets[currentIndex].name}",
            action: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DetailPage(planet: planets[currentIndex]),
                ),
              );
            },
          ),
          Positioned(
            top: 165,
            left: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              alignment: Alignment.centerLeft,
              child: const Text(
                "Which planet\nwould you like to explore?",
                style: AppTextStyles.title,
              ),
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.symmetric(vertical: 26),
            child: const Text("Explore", style: AppTextStyles.title),
          ),
          Positioned(
            bottom: 131,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.primary,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        if (currentIndex > 0) {
                          _pageController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                    ),
                  ),
                  Text(
                    planets[currentIndex].name,
                    style: AppTextStyles.subTitle,
                  ),
                  CircleAvatar(
                    backgroundColor: AppColors.primary,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        if (currentIndex < planets.length - 1) {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
