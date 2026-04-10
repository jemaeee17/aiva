import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  final String username = "Harry Potter";
  final String email = "harrypotter@email.com";
  final String? imageUrl = null; // null = no image

  String getInitials(String name) {
    final parts = name.trim().split(" ");
    if (parts.length == 1) return parts[0][0].toUpperCase();
    return parts[0][0] + parts[1][0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 20),

              // 🔹 PROFILE IMAGE / INITIALS
              CircleAvatar(
                radius: 45,
                backgroundColor: Colors.deepPurple,
                backgroundImage: imageUrl != null
                    ? NetworkImage(imageUrl!)
                    : null,
                child: imageUrl == null
                    ? Text(
                        getInitials(username),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : null,
              ),

              const SizedBox(height: 15),

              // 🔹 NAME
              Text(
                username,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 4),

              // 🔹 EMAIL
              Text(email, style: const TextStyle(color: Colors.grey)),

              const SizedBox(height: 15),

              // 🔹 EDIT BUTTON
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text("Edit Profile"),
              ),

              const SizedBox(height: 30),

              // 🔹 SETTINGS CARD
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Settings",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(height: 15),

                    _settingItem(Icons.palette, "Theme"),
                    _settingItem(Icons.notifications, "Notifications"),
                    _settingItem(Icons.lock, "Manage Password"),
                    _settingItem(Icons.logout, "Logout"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 🔹 SETTINGS ITEM
  Widget _settingItem(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 10),
          Text(title),
        ],
      ),
    );
  }
}
