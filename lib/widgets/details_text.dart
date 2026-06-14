import 'package:flutter/material.dart';
import 'package:space/core/constants.dart';

class DetailsText extends StatelessWidget {
  final String text;

  const DetailsText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final parts = text.split(': ');
    final label = parts.length >= 1 ? parts[0].trim() : '';
    final value = parts.length >= 2 ? parts[1].trim() : text;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.divider),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: AppTextStyles.body),
          Text(value, style: AppTextStyles.bodyBold),
        ],
      ),
    );
  }
}
