import 'package:flutter/material.dart';

class MachineControlScreen extends StatefulWidget {
  final String machineName;
  final String machineStatus;
  final int batteryLevel;

  const MachineControlScreen({
    super.key,
    required this.machineName,
    required this.machineStatus,
    required this.batteryLevel,
  });

  @override
  State<MachineControlScreen> createState() => _MachineControlScreenState();
}

class _MachineControlScreenState extends State<MachineControlScreen> {
  double _currentSpeed = 50.0;
  bool _isConnected = true;
  bool _autoModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.machineName} Control'),
        backgroundColor: const Color(0xFF1E1E1E),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF121212),
              Color(0xFF1E1E1E),
            ],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Machine Status Card
              _buildStatusCard(),
              const SizedBox(height: 32),
              
              // Control Section
              _buildControlSection(),
              const SizedBox(height: 32),
              
              // Advanced Controls
              _buildAdvancedControls(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusCard() {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: const Color(0xFF252525),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Machine Icon
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blueAccent.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.agriculture, size: 32, color: Colors.blueAccent),
            ),
            const SizedBox(width: 16),
            
            // Machine Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.machineName,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: _isConnected ? Colors.green : Colors.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        _isConnected ? 'Connected' : 'Disconnected',
                        style: TextStyle(
                          color: _isConnected ? Colors.green : Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            // Battery Indicator
            Column(
              children: [
                const Icon(Icons.battery_full, color: Colors.white70),
                Text(
                  '${widget.batteryLevel}%',
                  style: const TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildControlSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Speed Control',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 16),
        Slider(
          value: _currentSpeed,
          min: 0,
          max: 100,
          divisions: 10,
          label: _currentSpeed.round().toString(),
          activeColor: Colors.blueAccent,
          inactiveColor: Colors.blueAccent.withOpacity(0.2),
          onChanged: (value) {
            setState(() {
              _currentSpeed = value;
            });
          },
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '0%',
              style: TextStyle(color: Colors.white.withOpacity(0.7)),
            ),
            Text(
              '${_currentSpeed.round()}%',
              style: const TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '100%',
              style: TextStyle(color: Colors.white.withOpacity(0.7)),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildControlButton(
              icon: Icons.play_arrow,
              label: 'Start',
              color: Colors.green,
              onPressed: () {},
            ),
            _buildControlButton(
              icon: Icons.stop,
              label: 'Stop',
              color: Colors.red,
              onPressed: () {},
            ),
            _buildControlButton(
              icon: Icons.pause,
              label: 'Pause',
              color: Colors.amber,
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildControlButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: Icon(icon, size: 32, color: color),
            onPressed: onPressed,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(color: color),
        ),
      ],
    );
  }

  Widget _buildAdvancedControls() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Advanced Controls',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 16),
        SwitchListTile(
          title: const Text(
            'Auto Mode',
            style: TextStyle(color: Colors.white70),
          ),
          subtitle: const Text(
            'Enable automatic operation',
            style: TextStyle(color: Colors.white54),
          ),
          value: _autoModeEnabled,
          activeColor: Colors.blueAccent,
          onChanged: (value) {
            setState(() {
              _autoModeEnabled = value;
            });
          },
        ),
        const SizedBox(height: 8),
        ListTile(
          title: const Text(
            'Calibration',
            style: TextStyle(color: Colors.white70),
          ),
          subtitle: const Text(
            'Calibrate machine sensors',
            style: TextStyle(color: Colors.white54),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white70),
            onPressed: () {},
          ),
        ),
        const SizedBox(height: 8),
        ListTile(
          title: const Text(
            'Diagnostics',
            style: TextStyle(color: Colors.white70),
          ),
          subtitle: const Text(
            'Run system diagnostics',
            style: TextStyle(color: Colors.white54),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white70),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}