import 'package:flutter/material.dart';
import 'package:space/core/constants.dart';

class DetailsText extends StatelessWidget {
  final String text;

  const DetailsText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: AppTextStyles.bodyBold);
  }
}
