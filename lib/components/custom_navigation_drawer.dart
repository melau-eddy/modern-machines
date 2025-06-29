import 'package:flutter/material.dart';
import '../screens/map_screen.dart';

class CustomNavigationDrawer extends StatelessWidget {
  const CustomNavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color(0xFF1E1E1E),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blueAccent, Colors.tealAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Land Machine Control',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Control & Monitor',
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard, color: Colors.white70),
              title: const Text('Dashboard', style: TextStyle(color: Colors.white70)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.map, color: Colors.white70),
              title: const Text('Map View', style: TextStyle(color: Colors.white70)),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MapScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.white70),
              title: const Text('Settings', style: TextStyle(color: Colors.white70)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}