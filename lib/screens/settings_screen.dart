import 'package:flutter/material.dart';
import 'profile_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Settings',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ListTile(
            leading: const Icon(Icons.person, color: Colors.white70),
            title: const Text('Profile', style: TextStyle(color: Colors.white70)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
          ),
          const ListTile(
            leading: Icon(Icons.notifications, color: Colors.white70),
            title: Text('Notifications', style: TextStyle(color: Colors.white70)),
          ),
          const ListTile(
            leading: Icon(Icons.security, color: Colors.white70),
            title: Text('Security', style: TextStyle(color: Colors.white70)),
          ),
        ],
      ),
    );
  }
}