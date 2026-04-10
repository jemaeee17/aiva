import 'package:flutter/material.dart';

class LessonResultScreen extends StatelessWidget {
  final String subject;
  final String gradeLevel;
  final String topic;
  final List<String> objectives;
  final String content;

  const LessonResultScreen({
    super.key,
    required this.subject,
    required this.gradeLevel,
    required this.topic,
    required this.objectives,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    final sections = _parseContent(content);

    return Scaffold(
      appBar: AppBar(title: const Text("Lesson Details")),
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🔹 SUBJECT + GRADE
            Row(
              children: [
                _infoChip(subject),
                const SizedBox(width: 8),
                _infoChip(gradeLevel),
              ],
            ),

            const SizedBox(height: 20),

            /// 🔹 TOPIC
            _sectionTitle("Topic"),
            const SizedBox(height: 6),
            Text(
              topic,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 24),

            /// 🔹 OBJECTIVES (from form)
            _sectionTitle("Objectives"),
            const SizedBox(height: 10),
            ...objectives
                .where((e) => e.trim().isNotEmpty)
                .map(
                  (obj) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("• "),
                        Expanded(child: Text(obj)),
                      ],
                    ),
                  ),
                ),

            const SizedBox(height: 24),

            /// 🔹 AI GENERATED SECTIONS
            if (sections['Activities'] != null)
              _sectionCard("Activities", sections['Activities']!),

            if (sections['Assessment'] != null)
              _sectionCard("Assessment", sections['Assessment']!),

            if (sections['Content'] != null)
              _sectionCard("Lesson Content", sections['Content']!),
          ],
        ),
      ),
    );
  }

  /// 🔥 PARSE AI CONTENT INTO SECTIONS
  Map<String, String> _parseContent(String text) {
    final Map<String, String> sections = {};

    final lines = text.split('\n');

    String currentSection = "Content";
    String buffer = "";

    for (var line in lines) {
      final lower = line.toLowerCase();

      if (lower.contains("activities")) {
        sections[currentSection] = buffer.trim();
        currentSection = "Activities";
        buffer = "";
      } else if (lower.contains("assessment")) {
        sections[currentSection] = buffer.trim();
        currentSection = "Assessment";
        buffer = "";
      } else {
        buffer += "$line\n";
      }
    }

    sections[currentSection] = buffer.trim();

    return sections;
  }

  /// 🔹 SECTION TITLE
  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }

  /// 🔹 CARD SECTION
  Widget _sectionCard(String title, String content) {
    final items = content
        .split('\n')
        .where((e) => e.trim().isNotEmpty)
        .toList();

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(blurRadius: 6, color: Colors.black12, offset: Offset(0, 3)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// TITLE
          Text(
            title,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 10),

          /// BULLET LIST
          ...items.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("• "),
                  Expanded(child: Text(item)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 🔹 CHIP
  Widget _infoChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(text, style: const TextStyle(fontSize: 12)),
    );
  }
}
