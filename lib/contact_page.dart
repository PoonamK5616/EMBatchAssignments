import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  void _showActionSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],

      // ==========================================
      // APP BAR (Scaffold, AppBar, Text, Icon, IconButton)
      // ==========================================
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            } else {
              _showActionSnackBar(context, 'Back button tapped');
            }
          },
        ),
        title: const Text(
          'Contact & Services',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share_outlined, color: Colors.black),
            onPressed: () => _showActionSnackBar(context, 'Share page clicked'),
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () =>
                _showActionSnackBar(context, 'Options menu clicked'),
          ),
        ],
      ),

      // ==========================================
      // BODY (SingleChildScrollView, Column, Padding)
      // ==========================================
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ======================================
            // INSTAGRAM-INSPIRED PROFILE HEADER BANNER
            // (Card, Container, Padding, Row, Column, SizedBox, Text, Icon, OutlinedButton, Expanded)
            // ======================================
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          // Profile / Brand Avatar Icon inside Container
                          Container(
                            width: 64,
                            height: 64,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: const LinearGradient(
                                colors: [
                                  Colors.purple,
                                  Colors.orange,
                                  Colors.pink,
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: const Icon(
                                  Icons.storefront_rounded,
                                  size: 32,
                                  color: Colors.pinkAccent,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          // Expanded Info Text
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: const [
                                    Flexible(
                                      child: Text(
                                        'Tech & Academic Hub',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    SizedBox(width: 4),
                                    Icon(
                                      Icons.verified,
                                      size: 16,
                                      color: Colors.blue,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                const Text(
                                  'CS Dept • Kharghar Campus',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 6),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 3,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.green.shade50,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: const [
                                      Icon(
                                        Icons.circle,
                                        size: 8,
                                        color: Colors.green,
                                      ),
                                      SizedBox(width: 4),
                                      Flexible(
                                        child: Text(
                                          'Available 9 AM - 5 PM',
                                          style: TextStyle(
                                            fontSize: 11,
                                            color: Colors.green,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // Action Row with OutlinedButton and TextButton
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton.icon(
                              onPressed: () => _showActionSnackBar(
                                context,
                                'Opening quick message form...',
                              ),
                              icon: const Icon(
                                Icons.chat_bubble_outline,
                                size: 18,
                              ),
                              label: const Text('Send Message'),
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () => _showActionSnackBar(
                                context,
                                'Initiating call support...',
                              ),
                              icon: const Icon(Icons.phone_outlined, size: 18),
                              label: const Text('Call Us'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.pinkAccent,
                                foregroundColor: Colors.white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // ======================================
            // SECTION HEADER 1: OUR SERVICES
            // ======================================
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
              child: Text(
                'OUR SERVICES',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                  color: Colors.grey,
                ),
              ),
            ),

            // Service Item 1: App Development (Card, Padding, Row, Container, Icon, Expanded, Column, Text, SizedBox, ElevatedButton)
            _buildServiceCard(
              context: context,
              icon: Icons.code_rounded,
              iconBgColor: Colors.blue.shade50,
              iconColor: Colors.blue,
              title: 'Mobile App Development',
              description: 'Custom Flutter & mobile UI development tailored for modern business apps.',
              actionWidget: ElevatedButton(
                onPressed: () => _showActionSnackBar(
                  context,
                  'Requested: Mobile App Development',
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Request', style: TextStyle(fontSize: 12)),
              ),
            ),

            // Service Item 2: UI/UX Design Consultation (Card, Padding, Row, Container, Icon, Expanded, Column, Text, SizedBox, OutlinedButton)
            _buildServiceCard(
              context: context,
              icon: Icons.palette_outlined,
              iconBgColor: Colors.purple.shade50,
              iconColor: Colors.purple,
              title: 'UI/UX Design Consultation',
              description: 'Instagram-styled layouts, wireframing, interactive prototyping & design reviews.',
              actionWidget: OutlinedButton(
                onPressed: () => _showActionSnackBar(
                  context,
                  'Selected: UI/UX Design Consultation',
                ),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Explore', style: TextStyle(fontSize: 12)),
              ),
            ),

            // Service Item 3: Academic & Research Support
            _buildServiceCard(
              context: context,
              icon: Icons.school_outlined,
              iconBgColor: Colors.amber.shade50,
              iconColor: Colors.amber.shade900,
              title: 'Academic & Lab Guidance',
              description: 'Computer Science assignment help, code formatting, and project mentoring.',
              actionWidget: TextButton(
                onPressed: () => _showActionSnackBar(
                  context,
                  'Opened: Academic & Lab Guidance',
                ),
                child: const Text(
                  'Details >',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            // ======================================
            // DIVIDER (Divider, Padding)
            // ======================================
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
              child: Divider(thickness: 1, height: 1),
            ),

            // ======================================
            // SECTION HEADER 2: QUICK CONTACT & HELP
            // ======================================
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
              child: Text(
                'QUICK CONTACT',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                  color: Colors.grey,
                ),
              ),
            ),

            // Contact Item 1: Email Support
            _buildServiceCard(
              context: context,
              icon: Icons.email_outlined,
              iconBgColor: Colors.red.shade50,
              iconColor: Colors.red,
              title: 'Official Email Contact',
              description: 'poonam.khanvilkar@cs.kharghar.edu.in',
              actionWidget: IconButton(
                icon: const Icon(Icons.arrow_forward_ios, size: 16),
                onPressed: () =>
                    _showActionSnackBar(context, 'Opening email composer...'),
              ),
            ),

            // Contact Item 2: Office Location
            _buildServiceCard(
              context: context,
              icon: Icons.location_on_outlined,
              iconBgColor: Colors.teal.shade50,
              iconColor: Colors.teal,
              title: 'Department Office',
              description: 'Room 304, Computer Science Dept, Kharghar Campus, Navi Mumbai.',
              actionWidget: IconButton(
                icon: const Icon(
                  Icons.map_outlined,
                  size: 20,
                  color: Colors.teal,
                ),
                onPressed: () => _showActionSnackBar(
                  context,
                  'Viewing campus location map...',
                ),
              ),
            ),

            // Contact Item 3: Feedback & Rating
            _buildServiceCard(
              context: context,
              icon: Icons.rate_review_outlined,
              iconBgColor: Colors.orange.shade50,
              iconColor: Colors.orange,
              title: 'Student & Client Feedback',
              description:
                  'Share your homework feedback or suggest next features.',
              actionWidget: ElevatedButton(
                onPressed: () =>
                    _showActionSnackBar(context, 'Feedback form ready!'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Give Feedback',
                  style: TextStyle(fontSize: 11),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Footer info / Widget breakdown checklist
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              color: Colors.white,
              child: Column(
                children: [
                  const Icon(Icons.flutter_dash, size: 36, color: Colors.blue),
                  const SizedBox(height: 8),
                  const Text(
                    'Assignment 4 • Contact & Services UI',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Poonam Suresh Khanvilkar (Assistant Professor-CS)',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    alignment: WrapAlignment.center,
                    children: [
                      _buildWidgetTag('Scaffold'),
                      _buildWidgetTag('AppBar'),
                      _buildWidgetTag('Column'),
                      _buildWidgetTag('Row'),
                      _buildWidgetTag('Text'),
                      _buildWidgetTag('Icon'),
                      _buildWidgetTag('Container'),
                      _buildWidgetTag('Card'),
                      _buildWidgetTag('Padding'),
                      _buildWidgetTag('SizedBox'),
                      _buildWidgetTag('Divider'),
                      _buildWidgetTag('Button'),
                      _buildWidgetTag('Expanded'),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // =========================================================================
  // HELPER WIDGET FOR SERVICE CARDS
  // Demonstrates: Card, Padding, Row, Container, Icon, Expanded, Column, Text, SizedBox
  // =========================================================================
  Widget _buildServiceCard({
    required BuildContext context,
    required IconData icon,
    required Color iconBgColor,
    required Color iconColor,
    required String title,
    required String description,
    required Widget actionWidget,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
          side: BorderSide(color: Colors.grey.shade200, width: 1),
        ),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Row(
            children: [
              // Icon inside a rounded Container
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: iconBgColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: iconColor, size: 26),
              ),
              const SizedBox(width: 14),

              // Service Name & Short Description inside Expanded Column
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 12.5,
                        color: Colors.grey.shade600,
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 10),

              // Button / Arrow Action Widget
              actionWidget,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWidgetTag(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.blue.shade100),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 10.5,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    );
  }
}
