import 'package:flutter/material.dart';
import 'package:aiva/core/constants/app_colors.dart';
import 'lesson_item.dart';

class DashboardRecentLessons extends StatelessWidget {
  const DashboardRecentLessons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Recent Lessons",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.splashText,
            ),
          ),
          const SizedBox(height: 10),

          SingleChildScrollView(
            child: Column(
              children: const [
                LessonItem(
                  title: "Fractions 101",
                  subject: "Math",
                  dateTime: "March 20",
                ),
                LessonItem(
                  title: "Photosynthesis",
                  subject: "Science",
                  dateTime: "March 19",
                ),
                LessonItem(
                  title: "Atoms",
                  subject: "Chemistry",
                  dateTime: "March 19",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
