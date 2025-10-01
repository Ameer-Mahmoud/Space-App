import 'package:flutter/material.dart';
import 'package:space/detail_page.dart';
import 'explore_button.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  final List<String> planetNames = [
    "Sun",
    "Mercury",
    "Venus",
    "Earth",
    "Mars",
    "Jupiter",
    "Saturn",
    "Uranus",
    "Neptune",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0E0E0E),
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
                      const Color(0xff0E0E0E).withOpacity(0.8),
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
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                children: [
                  Image.asset("assets/images/sun.png"),
                  Image.asset("assets/images/mercury.png"),
                  Image.asset("assets/images/venus.png"),
                  Image.asset("assets/images/earth.png"),
                  Image.asset("assets/images/mars.png"),
                  Image.asset("assets/images/jupiter.png"),
                  Image.asset("assets/images/saturn.png"),
                  Image.asset("assets/images/uranus.png"),
                  Image.asset("assets/images/neptune.png"),
                ],
              ),
            ),
          ),

          ExploreButton(
            text: "Explore ${planetNames[currentIndex]}",
            action: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailPage(planetIndex: currentIndex,)),
              );
            },
          ),

          Positioned(
            top: 165,
            left: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              alignment: Alignment.centerLeft,
              child: Text(
                "Which planet\nwould you like to explore?",
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: Colors.white,
                  fontFamily: "SpaceGrotesk",
                ),
              ),
            ),
          ),

          Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.symmetric(vertical: 26),
            child: const Text(
              "Explore",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontFamily: "SpaceGrotesk",
              ),
            ),
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
                    backgroundColor: const Color(0xffEE403D),
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
                    planetNames[currentIndex],
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Colors.white,
                      fontFamily: "SpaceGrotesk",
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: const Color(0xffEE403D),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_forward, color: Colors.white),
                      onPressed: () {
                        if (currentIndex < planetNames.length - 1) {
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
