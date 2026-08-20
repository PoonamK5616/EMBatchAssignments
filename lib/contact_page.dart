import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Our Services'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'What We Offer',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Explore our services designed to help you.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 20),

            ServiceCard(
              icon: Icons.design_services,
              serviceName: 'UI/UX Design',
              description:
                  'Beautiful and user-friendly designs for your applications.',
            ),

            const SizedBox(height: 12),

            ServiceCard(
              icon: Icons.code,
              serviceName: 'App Development',
              description:
                  'Modern and responsive mobile applications.',
            ),

            const SizedBox(height: 12),

            ServiceCard(
              icon: Icons.web,
              serviceName: 'Web Development',
              description:
                  'Fast and responsive websites for your business.',
            ),

            const SizedBox(height: 12),

            ServiceCard(
              icon: Icons.support_agent,
              serviceName: 'Support',
              description:
                  'Get help and guidance whenever you need it.',
            ),
          ],
        ),
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final IconData icon;
  final String serviceName;
  final String description;

  const ServiceCard({
    super.key,
    required this.icon,
    required this.serviceName,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              child: Icon(
                icon,
                size: 32,
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    serviceName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),
    );
  }
}