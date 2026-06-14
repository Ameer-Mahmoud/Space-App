import 'package:flutter/material.dart';

class Planet {
  final String name;
  final String title;
  final String image;
  final String bigImage;
  final String modelPath;
  final String about;
  final List<String> details;
  final Color accentColor;

  const Planet({
    required this.name,
    required this.title,
    required this.image,
    required this.bigImage,
    required this.modelPath,
    required this.about,
    required this.details,
    this.accentColor = const Color(0xffEE403D),
  });
}
