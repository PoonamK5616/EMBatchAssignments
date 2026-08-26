import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Contact & Services',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),

                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(16),
                ),

                child: Column(
                  children: const [
                    Icon(Icons.contact_support, size: 60, color: Colors.black),

                    SizedBox(height: 12),

                    Text(
                      'How Can I Help You?',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 8),

                    Text(
                      'Explore the services below and choose what you need.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // Services Heading
              const Text(
                'My Services',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 12),

              // Service 1
              Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16),

                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,

                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(12),
                        ),

                        child: const Icon(Icons.phone_android, size: 28),
                      ),

                      const SizedBox(width: 15),

                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'App Development',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 5),

                            Text(
                              'Build modern and user-friendly mobile applications.',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),

                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_forward_ios, size: 18),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Service 2
              Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16),

                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,

                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(12),
                        ),

                        child: const Icon(Icons.language, size: 28),
                      ),

                      const SizedBox(width: 15),

                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Web Development',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 5),

                            Text(
                              'Create responsive and attractive websites.',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),

                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_forward_ios, size: 18),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Service 3
              Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16),

                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,

                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(12),
                        ),

                        child: const Icon(Icons.design_services, size: 28),
                      ),

                      const SizedBox(width: 15),

                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'UI/UX Design',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 5),

                            Text(
                              'Design clean, simple and user-friendly interfaces.',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),

                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_forward_ios, size: 18),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Service 4
              Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16),

                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,

                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(12),
                        ),

                        child: const Icon(Icons.code, size: 28),
                      ),

                      const SizedBox(width: 15),

                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Programming Help',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 5),

                            Text(
                              'Get help with programming and college projects.',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),

                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_forward_ios, size: 18),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 25),

              const Divider(),

              const SizedBox(height: 20),

              // Contact Section
              const Text(
                'Get In Touch',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 12),

              Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(18),

                  child: Column(
                    children: [
                      const Icon(Icons.email_outlined, size: 45),

                      const SizedBox(height: 10),

                      const Text(
                        'Have a question?',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 6),

                      const Text(
                        'Feel free to get in touch for more information.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),

                      const SizedBox(height: 15),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.mail_outline),
                          label: const Text('Contact Me'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
