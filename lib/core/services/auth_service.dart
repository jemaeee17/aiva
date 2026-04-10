import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final supabase = Supabase.instance.client;

  Future<String?> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      //register user
      final response = await supabase.auth.signUp(
        email: email,
        password: password,
      );

      final user = response.user;

      if (user == null) {
        return "Registration failed. Please try again.";
      }

      //insert data to database
      await supabase.from('profiles').insert({
        'id': user.id,
        'name': name,
        'email': email,
      });

      return null;
    } on AuthException catch (e) {
      return e.message;
    } catch (e) {
      return "Something went wrong";
    }
  }

  Future<String?> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      final user = response.user;

      if (user == null) {
        return "Login failed. Please try again,";
      }
      return null;
    } on AuthException catch (e) {
      return e.message;
    } catch (e) {
      return "Something went wrong.";
    }
  }
}
