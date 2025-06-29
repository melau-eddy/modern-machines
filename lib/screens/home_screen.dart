import 'package:flutter/material.dart';
import '../components/machine_card.dart';
import '../components/control_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Machine Status',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            children: [
              MachineCard(
                name: 'Tractor A',
                status: 'Active',
                battery: 85,
                onControlPressed: () {},
              ),
              MachineCard(
                name: 'Harvester B',
                status: 'Idle',
                battery: 60,
                onControlPressed: () {},
              ),
              MachineCard(
                name: 'Plow C',
                status: 'Maintenance',
                battery: 20,
                onControlPressed: () {},
              ),
              MachineCard(
                name: 'Sprayer D',
                status: 'Active',
                battery: 95,
                onControlPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'Quick Controls',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ControlButton(
                icon: Icons.play_arrow,
                label: 'Start',
                onPressed: () {},
              ),
              ControlButton(
                icon: Icons.stop,
                label: 'Stop',
                onPressed: () {},
              ),
              ControlButton(
                icon: Icons.refresh,
                label: 'Reset',
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}