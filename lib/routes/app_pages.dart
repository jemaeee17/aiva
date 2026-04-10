import 'package:aiva/features/auth/screens/forgot_password_screen.dart';
import 'package:aiva/features/auth/screens/login_screen.dart';
import 'package:aiva/features/auth/screens/register_screen.dart';
import 'package:aiva/features/onboarding/screens/onboarding_screen.dart';
import 'package:aiva/features/dashboard/screens/dashboard_screen.dart';
import 'package:aiva/features/favorites/screens/favorites_screen.dart';
import 'package:aiva/features/schedule/screens/schedule_screen.dart';
import 'package:aiva/features/profile/screens/profile_screen.dart';
import 'package:aiva/features/lesson_plan/widgets/lesson_plan_form.dart';
import 'package:aiva/presentation/main_screen.dart';
import 'package:flutter/material.dart';

class AppPages {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case '/forgot-password':
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());

      case '/onboarding':
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());

      case '/register':
        return MaterialPageRoute(builder: (_) => const RegisterScreen());

      case '/dashboard':
        return MaterialPageRoute(builder: (_) => const DashboardScreen());

      case '/favorites':
        return MaterialPageRoute(builder: (_) => const FavoritesScreen());

      case '/schedule':
        return MaterialPageRoute(builder: (_) => const ScheduleScreen());

      case '/profile':
        return MaterialPageRoute(builder: (_) => const ProfileScreen());

      case 'lesson-plan-form':
        return MaterialPageRoute(builder: (_) => const LessonPlanFormModal());

      case '/main-screen':
        return MaterialPageRoute(builder: (_) => const MainScreen());

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text("No route found"))),
        );
    }
  }
}
