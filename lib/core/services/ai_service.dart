import 'dart:convert';
import 'package:http/http.dart' as http;

class AIService {
  static const String apiKey = "AIzaSyBM4EkFxAMva445iUAWqM6Sg4DEYGgZuzI";

  static Future<String> generateLesson({
    required String subject,
    required String grade,
    required String topic,
    required String objectives,
    required String duration,
  }) async {
    final url = Uri.parse(
      "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=AIzaSyBM4EkFxAMva445iUAWqM6Sg4DEYGgZuzI",
    );

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "contents": [
          {
            "parts": [
              {
                "text":
                    """
You are an expert teacher.

Create a detailed lesson plan based on the following details:

Subject: $subject
Grade Level: $grade
Topic: $topic
Objectives: $objectives
Duration: $duration minutes

Use this format exactly:

Activities:
- ...

Assessment:
- ...

Content:
- ...

Guidelines:
- Make it appropriate for the grade level
- Keep explanations simple and clear
- Use bullet points (-)
- Do not add extra sections
""",
              },
            ],
          },
        ],
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['candidates'][0]['content']['parts'][0]['text'];
    } else {
      print("STATUS: ${response.statusCode}");
      print("BODY: ${response.body}");
      throw Exception("Failed to generate lesson");
    }
  }
}
