import 'package:flutter/material.dart';
import 'package:space/core/constants.dart';

class ExploreButton extends StatelessWidget {
  final String text;
  final VoidCallback action;

  const ExploreButton({super.key, required this.text, required this.action});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 22),
        child: InkWell(
          onTap: action,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(29),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                const Icon(Icons.arrow_right_alt_rounded, color: Colors.white),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
