import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool isMobile = true; 

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.indigo.shade50,
        actions: [
          TextButton.icon(
            onPressed: () {
              setState(() {
                isMobile = !isMobile;
              });
            },
            icon: Icon(isMobile ? Icons.phone_android : Icons.desktop_windows, color: Colors.indigo),
            label: Text(
              isMobile ? 'Mobile View' : 'Desktop View',
              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),

      drawer: isMobile ? const Drawer(child: AppMenu()) : null,
      body: Row(
        children: [

          if (!isMobile)
            const Expanded(
              flex: 2,
              child: AppMenu(),
            ),


          Expanded(
            flex: 8,
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [

                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.dashboard_customize, color: Colors.white, size: 32),
                      const SizedBox(width: 12),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Welcome Back, Admin!',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              isMobile
                                  ? 'Current Mode: Mobile View (2 Columns)'
                                  : 'Current Mode: Desktop View (4 Columns + Sidebar)',
                              style: const TextStyle(color: Colors.white70, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),


                const Text('Overview Metrics', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),

                  crossAxisCount: isMobile ? 2 : 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: isMobile ? 1.6 : 1.35,
                  children: const [
                    MetricTile(title: 'Revenue', value: '₹1,24,500', color: Colors.green),
                    MetricTile(title: 'Users', value: '2,840', color: Colors.blue),
                    MetricTile(title: 'Orders', value: '450', color: Colors.orange),
                    MetricTile(title: 'Pending', value: '14', color: Colors.red),
                  ],
                ),
                const SizedBox(height: 20),


                const Text('Recent Activities', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                const Card(
                  child: ListTile(
                    leading: Icon(Icons.shopping_cart, color: Colors.indigo),
                    title: Text('Order #4029 placed by Rahul'),
                    subtitle: Text('5 mins ago'),
                  ),
                ),
                const Card(
                  child: ListTile(
                    leading: Icon(Icons.check_circle, color: Colors.indigo),
                    title: Text('Payment received ₹1,499'),
                    subtitle: Text('20 mins ago'),
                  ),
                ),
                const Card(
                  child: ListTile(
                    leading: Icon(Icons.person_add, color: Colors.indigo),
                    title: Text('New customer registered'),
                    subtitle: Text('1 hour ago'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AppMenu extends StatelessWidget {
  const AppMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade100,
      child: ListView(
        padding: EdgeInsets.zero,
        children: const [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.indigo),
            child: Center(
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          ListTile(leading: Icon(Icons.home), title: Text('Dashboard'), selected: true),
          ListTile(leading: Icon(Icons.bar_chart), title: Text('Analytics')),
          ListTile(leading: Icon(Icons.settings), title: Text('Settings')),
        ],
      ),
    );
  }
}


class MetricTile extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  const MetricTile({super.key, required this.title, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color.withAlpha(25),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withAlpha(75)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: TextStyle(fontSize: 12, color: Colors.grey.shade700)),
          const SizedBox(height: 4),
          Text(value, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: color)),
        ],
      ),
    );
  }
}
