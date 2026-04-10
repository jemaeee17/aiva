import 'package:flutter/material.dart';
import 'package:aiva/core/constants/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:math';

class DashboardStatisticsCard extends StatefulWidget {
  const DashboardStatisticsCard({super.key});

  @override
  State<DashboardStatisticsCard> createState() =>
      _DashboardStatisticsCardState();
}

class _DashboardStatisticsCardState extends State<DashboardStatisticsCard> {
  int touchedIndex = -1;

  final double lessons = 40;
  final double timeSaved = 25;
  final double aiGenerations = 35;

  String getLabel(int index) {
    switch (index) {
      case 0:
        return "Lessons Created\n${lessons.toInt()}";
      case 1:
        return "Time Saved\n${timeSaved.toInt()}";
      case 2:
        return "AI Generations\n${aiGenerations.toInt()}";
      default:
        return "Tap a section";
    }
  }

  double getAngle(int index, double total) {
    final values = [lessons, timeSaved, aiGenerations];

    double startAngle = 0;

    for (int i = 0; i < index; i++) {
      startAngle += (values[i] / total) * 360;
    }

    final sweepAngle = (values[index] / total) * 360;

    return startAngle + (sweepAngle / 2);
  }

  Offset getPosition(double angle, double radius) {
    final rad = angle * pi / 180;
    return Offset(radius * cos(rad), radius * sin(rad));
  }

  @override
  Widget build(BuildContext context) {
    final total = lessons + timeSaved + aiGenerations;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.splashText,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.boxShadow,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Statistics & Progress",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: AppColors.primary,
            ),
          ),

          const SizedBox(height: 20),

          Center(
            child: GestureDetector(
              onTap: () {
                setState(() => touchedIndex = -1);
              },
              child: SizedBox(
                height: 180,
                width: 180,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    PieChart(
                      PieChartData(
                        sectionsSpace: 2,
                        centerSpaceRadius: 70,
                        pieTouchData: PieTouchData(
                          touchCallback: (event, response) {
                            if (response?.touchedSection == null) return;

                            setState(() {
                              touchedIndex =
                                  response!.touchedSection!.touchedSectionIndex;
                            });
                          },
                        ),
                        sections: List.generate(3, (index) {
                          final isTouched = index == touchedIndex;

                          final value = index == 0
                              ? lessons
                              : index == 1
                              ? timeSaved
                              : aiGenerations;

                          final color = index == 0
                              ? Colors.blue
                              : index == 1
                              ? Colors.green
                              : Colors.orange;

                          return PieChartSectionData(
                            value: value,
                            color: color,
                            radius: isTouched ? 28 : 20,
                            title: '',
                          );
                        }),
                      ),
                    ),

                    if (touchedIndex != -1)
                      Builder(
                        builder: (context) {
                          final angle = getAngle(touchedIndex, total);
                          final offset = getPosition(angle, 85);

                          return Transform.translate(
                            offset: offset,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                getLabel(touchedIndex),
                                style: const TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.splashText,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              _StatItem("Lessons Created", 40, Colors.blue),
              _StatItem("Time Saved", 25, Colors.green),
              _StatItem("AI Generations", 35, Colors.orange),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final int value;
  final Color color;

  const _StatItem(this.label, this.value, this.color);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(height: 6),
        Text(
          "$value",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
        Text(label, style: const TextStyle(fontSize: 11, color: Colors.grey)),
      ],
    );
  }
}
