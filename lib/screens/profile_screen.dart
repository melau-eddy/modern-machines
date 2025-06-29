import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController(text: 'John Doe');
  final _emailController = TextEditingController(text: 'john.doe@example.com');
  final _roleController = TextEditingController(text: 'Machine Operator');
  bool _autoModeEnabled = true;
  bool _notificationsEnabled = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _roleController.dispose();
    super.dispose();
  }

  void _saveProfile() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile saved successfully!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: const Color(0xFF1E1E1E),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Avatar Section
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.blueAccent,
                      child: ClipOval(
                        child: Image.network(
                          'https://via.placeholder.com/150',
                          width: 120,
                          height: 120,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => const Icon(
                            Icons.person,
                            size: 60,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.tealAccent,
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.camera_alt, color: Colors.black),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Image picker not implemented')),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // User Details Section
              const Text(
                'User Information',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  filled: true,
                  fillColor: Colors.white10,
                ),
                style: const TextStyle(color: Colors.white),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  filled: true,
                  fillColor: Colors.white10,
                ),
                style: const TextStyle(color: Colors.white),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _roleController,
                decoration: InputDecoration(
                  labelText: 'Role',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  filled: true,
                  fillColor: Colors.white10,
                ),
                style: const TextStyle(color: Colors.white),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your role';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              // Operator Preferences Section
              const Text(
                'Operator Preferences',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              SwitchListTile(
                title: const Text('Enable Auto Mode', style: TextStyle(color: Colors.white70)),
                value: _autoModeEnabled,
                activeColor: Colors.tealAccent,
                onChanged: (value) {
                  setState(() {
                    _autoModeEnabled = value;
                  });
                },
              ),
              SwitchListTile(
                title: const Text('Receive Notifications', style: TextStyle(color: Colors.white70)),
                value: _notificationsEnabled,
                activeColor: Colors.tealAccent,
                onChanged: (value) {
                  setState(() {
                    _notificationsEnabled = value;
                  });
                },
              ),
              const SizedBox(height: 24),
              // Save Button
              Center(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  child: ElevatedButton(
                    onPressed: _saveProfile,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text(
                      'Save Profile',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}