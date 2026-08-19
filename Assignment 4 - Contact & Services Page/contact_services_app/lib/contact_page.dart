import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contact & Services',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
        centerTitle: false,
      ),
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            _buildServiceItem(
              icon: Icons.support_agent,
              title: 'Customer Support',
              description: 'Get help with your issues and queries',
              onTap: () {},
            ),
            const Divider(height: 1, indent: 64),
            _buildServiceItem(
              icon: Icons.business_center_outlined,
              title: 'Business Inquiries',
              description: 'Partnerships and business opportunities',
              onTap: () {},
            ),
            const Divider(height: 1, indent: 64),
            _buildServiceItem(
              icon: Icons.feedback_outlined,
              title: 'Send Feedback',
              description: 'Help us improve by sharing your thoughts',
              onTap: () {},
            ),
            const Divider(height: 1, indent: 64),
            _buildServiceItem(
              icon: Icons.help_outline,
              title: 'FAQs',
              description: 'Find answers to frequently asked questions',
              onTap: () {},
            ),
            const Divider(height: 1, indent: 64),
            _buildServiceItem(
              icon: Icons.bug_report_outlined,
              title: 'Report a Bug',
              description: 'Let us know if something is not working',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceItem({
    required IconData icon,
    required String title,
    required String description,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        color: Colors.white,
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blue.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: Colors.blue, size: 24),
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
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[400]),
          ],
        ),
      ),
    );
  }
}
