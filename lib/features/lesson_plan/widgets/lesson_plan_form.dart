import 'package:flutter/material.dart';
import 'package:aiva/features/lesson_plan/screens/result_screen.dart';
import 'package:aiva/core/services/ai_service.dart';

class LessonPlanFormModal extends StatefulWidget {
  const LessonPlanFormModal({super.key});

  @override
  State<LessonPlanFormModal> createState() => _LessonPlanFormModalState();
}

class _LessonPlanFormModalState extends State<LessonPlanFormModal> {
  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  String? selectedGrade;

  final List<String> gradeLevels = [
    "Grade 1",
    "Grade 2",
    "Grade 3",
    "Grade 4",
    "Grade 5",
    "Grade 6",
  ];

  final subjectController = TextEditingController();
  final topicController = TextEditingController();
  final objectivesController = TextEditingController();
  final durationController = TextEditingController();

  @override
  void dispose() {
    subjectController.dispose();
    topicController.dispose();
    objectivesController.dispose();
    durationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        top: 24,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Fill up your lesson plan",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 20),

              TextFormField(
                controller: subjectController,
                decoration: const InputDecoration(
                  labelText: "Subject",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a subject";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 15),

              DropdownButtonFormField<String>(
                initialValue: selectedGrade,
                items: gradeLevels
                    .map((g) => DropdownMenuItem(value: g, child: Text(g)))
                    .toList(),
                onChanged: (value) {
                  setState(() => selectedGrade = value);
                },
                decoration: const InputDecoration(
                  labelText: "Grade Level",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null) {
                    return "Please select a grade level";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: topicController,
                decoration: const InputDecoration(
                  labelText: "Topic",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a topic";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: objectivesController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: "Objectives",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter objectives";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: durationController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Duration (minutes)",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter duration";
                  }
                  if (int.tryParse(value) == null) {
                    return "Enter a valid number";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: isLoading
                    ? null
                    : () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() => isLoading = true);

                          final navigator = Navigator.of(context);
                          final messenger = ScaffoldMessenger.of(context);

                          try {
                            final result = await AIService.generateLesson(
                              subject: subjectController.text,
                              grade: selectedGrade!,
                              topic: topicController.text,
                              objectives: objectivesController.text,
                              duration: durationController.text,
                            );

                            if (!mounted) return;

                            final objectivesList = objectivesController.text
                                .split('\n');

                            navigator.push(
                              MaterialPageRoute(
                                builder: (_) => LessonResultScreen(
                                  subject: subjectController.text,
                                  gradeLevel: selectedGrade!,
                                  topic: topicController.text,
                                  objectives: objectivesList,
                                  content: result,
                                ),
                              ),
                            );
                          } catch (e) {
                            if (!mounted) return;

                            messenger.showSnackBar(
                              SnackBar(content: Text("Error: $e")),
                            );
                          } finally {
                            if (mounted) {
                              setState(() => isLoading = false);
                            }
                          }
                        }
                      },
                child: isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Text("Generate"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
