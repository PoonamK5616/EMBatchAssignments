import 'package:flutter/material.dart';

class TeamPage extends StatelessWidget {
  const TeamPage({super.key});

  static const List<Map<String, dynamic>> members = [
    {
      'name': 'Aarav Mehta',
      'role': 'Product Designer',
      'icon': Icons.palette_rounded,
    },
    {
      'name': 'Maya Sharma',
      'role': 'Lead Developer',
      'icon': Icons.code_rounded,
    },
    {
      'name': 'Rohan Kapoor',
      'role': 'Data Analyst',
      'icon': Icons.analytics_rounded,
    },
    {
      'name': 'Ananya Rao',
      'role': 'Project Manager',
      'icon': Icons.manage_accounts_rounded,
    },
    {
      'name': 'Kabir Singh',
      'role': 'UI Developer',
      'icon': Icons.web_rounded,
    },
    {
      'name': 'Diya Patel',
      'role': 'Marketing Lead',
      'icon': Icons.campaign_rounded,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final columns = width < 700 ? 1 : width < 1050 ? 2 : 3;

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),
      appBar: AppBar(
        title: const Text(
          'Team',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        backgroundColor: const Color(0xFF203A5F),
        foregroundColor: Colors.white,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(24),
        itemCount: members.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: columns,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          childAspectRatio: 1.7,
        ),
        itemBuilder: (context, index) {
          final member = members[index];

          return TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0, end: 1),
            duration: Duration(
              milliseconds: 450 + index * 100,
            ),
            curve: Curves.easeOutBack,
            builder: (context, value, child) {
              return Transform.scale(
                scale: value,
                child: child,
              );
            },
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: const Color(0xFFD9E0EA),
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x0F203A5F),
                    blurRadius: 18,
                    offset: Offset(0, 8),
                  ),
                ],
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: const Color(0x4DE9C46A),
                    child: Icon(
                      member['icon'] as IconData,
                      color: const Color(0xFF203A5F),
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          member['name'] as String,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF162238),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          member['role'] as String,
                          style: const TextStyle(
                            color: Color(0xFF78879A),
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Row(
                          children: [
                            Icon(
                              Icons.circle,
                              size: 8,
                              color: Color(0xFF278C72),
                            ),
                            SizedBox(width: 6),
                            Text(
                              'Active now',
                              style: TextStyle(
                                color: Color(0xFF278C72),
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}