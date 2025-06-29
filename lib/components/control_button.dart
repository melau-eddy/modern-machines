import 'package:flutter/material.dart';

class ControlButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const ControlButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        backgroundColor: Colors.blueAccent.withOpacity(0.8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Column(
        children: [
          Icon(icon, size: 32, color: Colors.white),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}