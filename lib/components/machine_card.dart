import 'package:flutter/material.dart';
import '../screens/machine_control_screen.dart';

class MachineCard extends StatelessWidget {
  final String name;
  final String status;
  final int battery;
  final VoidCallback onControlPressed;

  const MachineCard({
    super.key,
    required this.name,
    required this.status,
    required this.battery,
    required this.onControlPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MachineControlScreen(
                machineName: name,
                machineStatus: status,
                batteryLevel: battery,
              ),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Colors.blueAccent, Colors.tealAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Status: $status',
                style: const TextStyle(color: Colors.white70),
              ),
              const SizedBox(height: 8),
              Text(
                'Battery: $battery%',
                style: const TextStyle(color: Colors.white70),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MachineControlScreen(
                        machineName: name,
                        machineStatus: status,
                        batteryLevel: battery,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Control',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}