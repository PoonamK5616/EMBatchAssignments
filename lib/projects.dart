import 'package:flutter/material.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  static const List<Map<String, dynamic>> projects = [
    {
      'name': 'NOVA AI',
      'type': 'Artificial Intelligence',
      'image': 'lib/assets/team.jpg',
      'progress': 0.82,
    },
    {
      'name': 'ORBIT',
      'type': 'Mobile Experience',
      'image': 'lib/assets/workspace.jpg',
      'progress': 0.64,
    },
    {
      'name': 'AURORA',
      'type': 'Data Visualisation',
      'image': 'lib/assets/laptop.jpg',
      'progress': 0.91,
    },
    {
      'name': 'ZENITH',
      'type': 'Digital Platform',
      'image': 'lib/assets/dashboard.jpg',
      'progress': 0.73,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final columns = width < 700 ? 1 : width < 1100 ? 2 : 3;

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),
      appBar: AppBar(
        title: const Text(
          'Projects',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        backgroundColor: const Color(0xFF203A5F),
        foregroundColor: Colors.white,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(24),
        itemCount: projects.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: columns,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          childAspectRatio: 1.25,
        ),
        itemBuilder: (context, index) {
          final project = projects[index];

          return TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0, end: 1),
            duration: Duration(
              milliseconds: 500 + index * 150,
            ),
            curve: Curves.easeOutBack,
            builder: (context, value, child) {
              return Transform.scale(
                scale: value,
                child: child,
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: const Color(0xFFD9E0EA),
                ),
              ),
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Image.asset(
                      project['image'] as String,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            project['name'] as String,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                              color: Color(0xFF162238),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            project['type'] as String,
                            style: const TextStyle(
                              color: Color(0xFF78879A),
                              fontSize: 11,
                            ),
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Expanded(
                                child: LinearProgressIndicator(
                                  value:
                                      project['progress'] as double,
                                  minHeight: 7,
                                  backgroundColor:
                                      const Color(0xFFE3E8EF),
                                  valueColor:
                                      const AlwaysStoppedAnimation<
                                          Color>(
                                    Color(0xFFC76D52),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                '${((project['progress'] as double) * 100).round()}%',
                                style: const TextStyle(
                                  color: Color(0xFFC76D52),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
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