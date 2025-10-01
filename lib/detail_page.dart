import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:space/details_text.dart';

class DetailPage extends StatelessWidget {
   int planetIndex;
   DetailPage({super.key, required this.planetIndex});

   List<Map<String, dynamic>> planets = [
    {
      "name": "Sun",
      "title": "Sun: The Heart of Our Solar System",
      "image": "assets/images/sun.png",
      "bigImage": "assets/images/sun.png",
      "model": "assets/3d/sun.glb",
      "about":
      "The Sun is the heart of our solar system, a massive ball of plasma that provides heat, light, and energy to everything within its gravitational pull. Its immense size and temperature are fueled by nuclear fusion, a process that combines hydrogen atoms into helium, releasing vast amounts of energy. The Sun's magnetic field, which is constantly changing, influences solar activity like sunspots and solar flares, affecting space weather and potentially disrupting Earth-based technologies.",
      "details": [

        "Radius (km): 696,340",
        "Mass (kg): 1.989 × 10³⁰",
        "Gravity (m/s²): 9.81",
        "Surface Area (km²) : 6.09 × 10¹²"
      ],
    },
    {
      "name": "Mercury",
      "title": "Mercury: The Closest Planet",
      "image": "assets/images/mercury.png",
      "bigImage": "assets/images/mercury.png",
      "model": "assets/3d/mercury.glb",
      "about":
      "Earth is the only known planet that supports life. Its unique mix of water, atmosphere, and distance from the Sun makes it habitable.",
      "details": [
        "Distance from Sun (km): 149,598,026",
        "Length of Day (hours): 23.93",
        "Orbital Period (years): 1",
        "Radius (km): 6,371",
        "Mass (kg): 5.972 × 10²⁴",
        "Gravity (m/s²): 9.81",
        "Surface Area (km²) : 5.10 × 10⁸"
      ],
    },
    {
      "name": "Venus",
      "title": "Venus: Earth's Toxic Twin",
      "image": "assets/images/venus.png",
      "bigImage": "assets/images/venus.png",
      "model": "assets/3d/venus.glb",
      "about":
      "Earth is the only known planet that supports life. Its unique mix of water, atmosphere, and distance from the Sun makes it habitable.",
      "details": [
        "Distance from Sun (km): 149,598,026",
        "Length of Day (hours): 23.93",
        "Orbital Period (years): 1",
        "Radius (km): 6,371",
        "Mass (kg): 5.972 × 10²⁴",
        "Gravity (m/s²): 9.81",
        "Surface Area (km²) : 5.10 × 10⁸"
      ],
    },
    {
      "name": "Earth",
      "title": "Earth: Our Blue Marble",
      "image": "assets/images/earth.png",
      "bigImage": "assets/images/earth_2.png",
      "model": "assets/3d/earth.glb",
      "about":
      "Earth is the only known planet that supports life. Its unique mix of water, atmosphere, and distance from the Sun makes it habitable.",
      "details": [
        "Distance from Sun (km): 149,598,026",
        "Length of Day (hours): 23.93",
        "Orbital Period (years): 1",
        "Radius (km): 6,371",
        "Mass (kg): 5.972 × 10²⁴",
        "Gravity (m/s²): 9.81",
        "Surface Area (km²) : 5.10 × 10⁸"
      ],
    },
    {
      "name": "Mars",
      "title": "Mars: The Red Planet",
      "image": "assets/images/mars.png",
      "bigImage": "assets/images/mars.png",
      "model": "assets/3d/mars.glb",
      "about":
      "Earth is the only known planet that supports life. Its unique mix of water, atmosphere, and distance from the Sun makes it habitable.",
      "details": [
        "Distance from Sun (km): 149,598,026",
        "Length of Day (hours): 23.93",
        "Orbital Period (years): 1",
        "Radius (km): 6,371",
        "Mass (kg): 5.972 × 10²⁴",
        "Gravity (m/s²): 9.81",
        "Surface Area (km²) : 5.10 × 10⁸"
      ],
    },
    {
      "name": "Jupiter",
      "title": "Jupiter: The Gas Giant",
      "image": "assets/images/jupiter.png",
      "bigImage": "assets/images/jupiter.png",
      "model": "assets/3d/jupiter.glb",
      "about":
      "Earth is the only known planet that supports life. Its unique mix of water, atmosphere, and distance from the Sun makes it habitable.",
      "details": [
        "Distance from Sun (km): 149,598,026",
        "Length of Day (hours): 23.93",
        "Orbital Period (years): 1",
        "Radius (km): 6,371",
        "Mass (kg): 5.972 × 10²⁴",
        "Gravity (m/s²): 9.81",
        "Surface Area (km²) : 5.10 × 10⁸"
      ],
    },
    {
      "name": "Saturn",
      "title": "Saturn: The Ringed Planet",
      "image": "assets/images/saturn.png",
      "bigImage": "assets/images/saturn.png",
      "model": "assets/3d/saturn.glb",
      "about":
      "Earth is the only known planet that supports life. Its unique mix of water, atmosphere, and distance from the Sun makes it habitable.",
      "details": [
        "Distance from Sun (km): 149,598,026",
        "Length of Day (hours): 23.93",
        "Orbital Period (years): 1",
        "Radius (km): 6,371",
        "Mass (kg): 5.972 × 10²⁴",
        "Gravity (m/s²): 9.81",
        "Surface Area (km²) : 5.10 × 10⁸"
      ],
    },
    {
      "name": "Uranus",
      "title": "Uranus: The Tilted Planet",
      "image": "assets/images/uranus.png",
      "bigImage": "assets/images/uranus.png",
      "model": "assets/3d/uranus.glb",
      "about":
      "Earth is the only known planet that supports life. Its unique mix of water, atmosphere, and distance from the Sun makes it habitable.",
      "details": [
        "Distance from Sun (km): 149,598,026",
        "Length of Day (hours): 23.93",
        "Orbital Period (years): 1",
        "Radius (km): 6,371",
        "Mass (kg): 5.972 × 10²⁴",
        "Gravity (m/s²): 9.81",
        "Surface Area (km²) : 5.10 × 10⁸"
      ],
    },
    {
      "name": "Neptune",
      "title": "Neptune",
      "image": "assets/images/neptune.png",
      "bigImage": "assets/images/neptune.png",
      "model": "assets/3d/neptune.glb",
      "about":
      "Earth is the only known planet that supports life. Its unique mix of water, atmosphere, and distance from the Sun makes it habitable.",
      "details": [
        "Distance from Sun (km): 149,598,026",
        "Length of Day (hours): 23.93",
        "Orbital Period (years): 1",
        "Radius (km): 6,371",
        "Mass (kg): 5.972 × 10²⁴",
        "Gravity (m/s²): 9.81",
        "Surface Area (km²) : 5.10 × 10⁸"
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    final planet = planets[planetIndex];

    return Scaffold(
      backgroundColor: const Color(0xff0E0E0E),
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.zero,
            children: [
              Stack(
                alignment: const Alignment(0, -0.3),
                children: [
                  Image.asset(
                    "assets/images/upper.png",
                    width: 300,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    width: double.infinity,
                    height: 150,
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

              Padding(
                padding: const EdgeInsets.only(top: 8, left: 20, right: 20),
                child: Text(
                  planet["title"],
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: Colors.white,
                    fontFamily: "SpaceGrotesk",
                  ),
                ),
              ),

              const SizedBox(height: 10),

              Center(
                child: SizedBox(
                  width: 342,
                  height: 339,
                  child: ModelViewer(
                    src: planet["model"],
                    alt: "A 3D model of ${planet["name"]}",
                    ar: true,
                    autoRotate: true,
                    cameraControls: true,
                    backgroundColor: Colors.transparent,
                  ),
                ),
              ),

              const SizedBox(height: 36),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "About",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontFamily: "SpaceGrotesk",
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      planet["about"],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                        fontFamily: "SpaceGrotesk",
                      ),
                    ),
                    const SizedBox(height: 20),

                    ...planet["details"].map<Widget>((d) => DetailsText(text: d)),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ],
          ),

          Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.symmetric(vertical: 26),
            child: Text(
              planet["name"],
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontFamily: "SpaceGrotesk",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
