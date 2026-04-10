import 'package:flutter/material.dart';
import 'package:aiva/core/constants/app_images.dart';
import 'package:aiva/core/constants/app_colors.dart';

class OnboardingScreen1 extends StatelessWidget {
  const OnboardingScreen1({super.key});

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
                AppImages.logo,
                width: 300,
                height: 300,
              ),

              const SizedBox(height:20),
              const Text(
                'Plan Smarter. Teach Better.',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
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