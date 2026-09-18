import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Analysis Result'),
        backgroundColor: const Color(0xFFEF4444), // Bright Red for High Risk
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Risk Score Container
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xFFFEF2F2), // Light red background
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFEF4444), width: 2),
              ),
              child: Column(
                children: const [
                  Text(
                    'HIGH RISK',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFEF4444),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '82 / 100',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF7F1D1D),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Red Flags Section
            const Text('RED FLAGS',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey)),
            const SizedBox(height: 12),
            _buildFlag(Icons.warning_amber_rounded,
                'Registration fee requested', Colors.orange),
            _buildFlag(Icons.warning_amber_rounded, 'Bank details requested',
                Colors.orange),
            _buildFlag(
                Icons.warning_amber_rounded, 'OTP requested', Colors.orange),
            _buildFlag(Icons.warning_amber_rounded, 'Guaranteed internship',
                Colors.orange),
            const SizedBox(height: 16),

            // Positive Signals Section
            const Text('POSITIVE SIGNALS',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey)),
            const SizedBox(height: 12),
            _buildFlag(Icons.check_circle, 'HTTPS enabled', Colors.green),
            const SizedBox(height: 24),

            // Recommendation Section
            const Text('RECOMMENDATION',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey)),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: const Text(
                'Verify the employer independently before proceeding. Do not make payments or share sensitive information.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
            ),
            const SizedBox(height: 32),

            // Start Over Button
            ElevatedButton(
              onPressed: () {
                // This safely returns the user to the very first Home Screen
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1E3A8A),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('ANALYZE ANOTHER',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
            )
          ],
        ),
      ),
    );
  }

  // Helper widget to easily build the list of flags
  Widget _buildFlag(IconData icon, String text, Color iconColor) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Icon(icon, color: iconColor),
          const SizedBox(width: 12),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 16))),
        ],
      ),
    );
  }
}
