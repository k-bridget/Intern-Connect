import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  String? _selectedRole; // 'student' or 'startup'

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A3A6B),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 48),

              // Logo + App name
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.handshake_rounded,
                  size: 48,
                  color: Color(0xFF1A3A6B),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'InternConnect',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Bridging Students & Startups at ALU',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),

              const SizedBox(height: 48),

              // Who are you label
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Who are you?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Role cards
              Row(
                children: [
                  // Student card
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _selectedRole = 'student'),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: _selectedRole == 'student'
                              ? Colors.white
                              : Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: _selectedRole == 'student'
                                ? Colors.white
                                : Colors.white30,
                            width: 2,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.school_rounded,
                              size: 40,
                              color: _selectedRole == 'student'
                                  ? const Color(0xFF1A3A6B)
                                  : Colors.white,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Student',
                              style: TextStyle(
                                color: _selectedRole == 'student'
                                    ? const Color(0xFF1A3A6B)
                                    : Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Find and apply for internships at ALU startups',
                              style: TextStyle(
                                color: _selectedRole == 'student'
                                    ? const Color(0xFF1A3A6B).withOpacity(0.7)
                                    : Colors.white70,
                                fontSize: 12,
                                height: 1.4,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 16),

                  // Startup card
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _selectedRole = 'startup'),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: _selectedRole == 'startup'
                              ? Colors.white
                              : Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: _selectedRole == 'startup'
                                ? Colors.white
                                : Colors.white30,
                            width: 2,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.rocket_launch_rounded,
                              size: 40,
                              color: _selectedRole == 'startup'
                                  ? const Color(0xFF1A3A6B)
                                  : Colors.white,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Startup',
                              style: TextStyle(
                                color: _selectedRole == 'startup'
                                    ? const Color(0xFF1A3A6B)
                                    : Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Post opportunities and find talented ALU students',
                              style: TextStyle(
                                color: _selectedRole == 'startup'
                                    ? const Color(0xFF1A3A6B).withOpacity(0.7)
                                    : Colors.white70,
                                fontSize: 12,
                                height: 1.4,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Features summary
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    _featureRow(Icons.search_rounded, 'Discover opportunities'),
                    const SizedBox(height: 12),
                    _featureRow(
                      Icons.verified_rounded,
                      'Verified startups by ALU students',
                    ),
                    const SizedBox(height: 12),
                    _featureRow(
                      Icons.track_changes_rounded,
                      'Track your applications',
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // Get Started button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _selectedRole == null
                      ? null
                      : () {
                          Navigator.pushReplacementNamed(
                            context,
                            '/auth',
                            arguments: _selectedRole,
                          );
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF1A3A6B),
                    disabledBackgroundColor: Colors.white30,
                    disabledForegroundColor: Colors.white60,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    _selectedRole == null
                        ? 'Select your role to continue'
                        : 'Get Started as ${_selectedRole == 'student' ? 'a Student' : 'a Startup'}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _featureRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.white70, size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white70, fontSize: 13),
          ),
        ),
      ],
    );
  }
}
