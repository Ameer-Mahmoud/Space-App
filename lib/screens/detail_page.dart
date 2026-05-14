import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:space/core/constants.dart';
import 'package:space/models/planet.dart';
import 'package:space/widgets/details_text.dart';

class DetailPage extends StatelessWidget {
  final Planet planet;

  const DetailPage({super.key, required this.planet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
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
                          AppColors.background.withOpacity(0.8),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 20, right: 20),
                child: Text(planet.title, style: AppTextStyles.title),
              ),
              const SizedBox(height: 10),
              Center(
                child: SizedBox(
                  width: 342,
                  height: 339,
                  child: ModelViewer(
                    src: planet.modelPath,
                    alt: "A 3D model of ${planet.name}",
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
                    const Text("About", style: AppTextStyles.title),
                    const SizedBox(height: 10),
                    Text(planet.about, style: AppTextStyles.body),
                    const SizedBox(height: 20),
                    ...planet.details.map((d) => DetailsText(text: d)),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.symmetric(vertical: 26),
            child: Text(planet.name, style: AppTextStyles.title),
          ),
        ],
      ),
    );
  }
}
