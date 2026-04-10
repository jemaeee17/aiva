import 'package:flutter/material.dart';
import 'package:aiva/core/constants/app_colors.dart';
import 'package:aiva/core/constants/app_images.dart';
import 'package:aiva/features/dashboard/widgets/dashboard_quick_button.dart';
import 'package:aiva/features/dashboard/widgets/dashboard_recent_lessons.dart';
import 'package:aiva/features/dashboard/widgets/dashboard_statistics_card.dart';
import 'package:aiva/features/lesson_plan/widgets/lesson_plan_form.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  String username = "Harry Potter";
  String? userImageUrl;

  String getInitials(String name) {
    List<String> parts = name.trim().split(" ");

    if (parts.length == 1) {
      return parts[0][0].toUpperCase();
    }

    return (parts[0][0] + parts[1][0].toUpperCase());
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _animation = Tween<double>(
      begin: -8,
      end: 8,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Good day ${username.split(" ")[0]}!",
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColors.splashText,
                              ),
                            ),

                            SizedBox(height: 6),

                            Text(
                              "Ready to build today's lessons?",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.splashText,
                              ),
                            ),
                          ],
                        ),
                      ),

                      CircleAvatar(
                        radius: 24,
                        backgroundColor: AppColors.splashText,
                        backgroundImage: userImageUrl != null
                            ? NetworkImage(userImageUrl!)
                            : null,
                        child: userImageUrl == null
                            ? Text(
                                getInitials(username),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              )
                            : null,
                      ),
                    ],
                  ),

                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        margin: const EdgeInsets.only(top: 40),
                        decoration: BoxDecoration(
                          color: AppColors.splashText,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.boxShadow,
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(right: 100),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Let's Get Started!",
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              SizedBox(height: 6),
                              Text(
                                "Build and manage your lessons daily.",
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(height: 16),
                              ElevatedButton.icon(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Dialog(
                                        insetPadding: const EdgeInsets.symmetric(horizontal: 16),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                        ),
                                        child: const LessonPlanFormModal(),
                                      );
                                    },
                                  );
                                },
                                icon: Icon(Icons.auto_awesome, size: 14),
                                label: Text(
                                  "Start AI Generation",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primary,
                                  foregroundColor: AppColors.splashText,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 10,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  elevation: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Positioned(
                        right: -25,
                        top: 30,
                        child: AnimatedBuilder(
                          animation: _animation,
                          builder: (context, child) {
                            return Transform.translate(
                              offset: Offset(0, _animation.value),
                              child: child,
                            );
                          },
                          child: Image.asset(
                            AppImages.aivaCharacter,
                            height: 230,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 60),

                  Row(
                    children: [
                      Expanded(
                        child: DashboardQuickButton(
                          icon: Icons.grid_view,
                          label: "Templates",
                          onTap: () {},
                        ),
                      ),
                      SizedBox(width: 6),
                      Expanded(
                        child: DashboardQuickButton(
                          icon: Icons.schedule,
                          label: "Schedule",
                          onTap: () {},
                        ),
                      ),
                      SizedBox(width: 6),
                      Expanded(
                        child: DashboardQuickButton(
                          icon: Icons.event,
                          label: "Planner",
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  const DashboardRecentLessons(),

                  DashboardStatisticsCard(),

                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
