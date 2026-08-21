import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact & Services'),
        centerTitle: true,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
            _buildServiceCard(
              icon: Icons.support_agent,
              title: 'Customer Support',
              description: 'Get help with your account issues',
            ),
            const SizedBox(height: 12),
            _buildServiceCard(
              icon: Icons.bug_report_outlined,
              title: 'Report a Bug',
              description: 'Let us know if something is broken',
            ),
            const SizedBox(height: 12),
            _buildServiceCard(
              icon: Icons.feedback_outlined,
              title: 'Send Feedback',
              description: 'Share your ideas to improve the app',
            ),
            const SizedBox(height: 12),
            _buildServiceCard(
              icon: Icons.business,
              title: 'Business Inquiries',
              description: 'Contact us for partnerships and ads',
            ),
          ],
        ),
      ),
        ),
      ),
    );
  }

  Widget _buildServiceCard({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 28, color: Colors.blue),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios, size: 18),
              onPressed: () {
                // The button only needs to exist
              },
            ),
          ],
        ),
      ),
    );
  }
}
