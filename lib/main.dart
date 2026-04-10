import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:aiva/routes/app_pages.dart';
import 'package:aiva/routes/app_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://civiwuaucyuljomtwawr.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNpdml3dWF1Y3l1bGpvbXR3YXdyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzUxMTE5OTQsImV4cCI6MjA5MDY4Nzk5NH0.1kB9QKUd0gyRdMYRyKqDboS4SzamrrF2YthP-5zACHs'
  );
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),

      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.onboarding,
      onGenerateRoute: AppPages.generateRoute,
    );
  }
}
