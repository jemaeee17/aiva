import 'package:flutter/material.dart';
import 'package:aiva/features/lesson_plan/widgets/action_button.dart';
import 'package:aiva/features/lesson_plan/widgets/tag_card.dart';
import 'package:aiva/features/lesson_plan/widgets/topic_card.dart';

class CreateLessonScreen extends StatelessWidget {
  const CreateLessonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 🔹 HEADER TEXT
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Ready to",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "conquer today's lessons?",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// 🔹 SEARCH BAR
              TextField(
                decoration: InputDecoration(
                  hintText: "Search lessons...",
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ActionButton(text: "Generate\nNew Lessons", onPressed: () {}),
                  ActionButton(text: "Recent\nLessons", onPressed: () {}),
                  ActionButton(text: "History", onPressed: () {}),
                ],
              ),

              const SizedBox(height: 20),

              const Text(
                "Latest Lesson",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 12),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 6,
                      color: Colors.black12,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "April 6, 2026 • 10:30 AM",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      "Introduction\n to Fractions",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 12),

                    Row(
                      children: [
                        TagCard(text: "Grade 4"),
                        const SizedBox(width: 8),
                        TagCard(text: "Mathematics"),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              const Text(
                "Explore other topics",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 12),

              SizedBox(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    TopicCard(title: "Fractions", subject: "Math"),
                    TopicCard(title: "Photosynthesis", subject: "Science"),
                    TopicCard(title: "World War II", subject: "History"),
                    TopicCard(title: "Adjectives", subject: "English"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
