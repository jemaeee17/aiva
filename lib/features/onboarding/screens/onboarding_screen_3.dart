import 'package:flutter/material.dart';
import 'package:aiva/core/constants/app_colors.dart';
import 'package:aiva/core/constants/app_images.dart';

class OnboardingScreen3 extends StatelessWidget {
  const OnboardingScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                AppImages.onboardingImage3,
                width: 400,
                height: 400,
              ),

              const SizedBox(height: 5),
              const Text(
                'Designed for Teachers.',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 22,
                  color: AppColors.splashText,
                ),
              ),

              const SizedBox(height: 10),
              const Text(
                'Built to support your workflow \n  and simplify your day.',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  color: AppColors.splashText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}