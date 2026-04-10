import 'package:aiva/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:aiva/core/constants/app_images.dart';

class OnboardingScreen2 extends StatelessWidget {
  const OnboardingScreen2({super.key});

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
                AppImages.onboardingImage2,
                width: 400,
                height: 400,
              ),

              const SizedBox(height: 5),
              const Text(
                'Instant Lesson Plans.',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 22,
                  color: AppColors.splashText,
                ),
              ),

              const SizedBox(height: 10),
              const Text(
                'No more starting from scratch-\n generate plans in seconds.',
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