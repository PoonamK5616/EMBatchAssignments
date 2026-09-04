import 'package:flutter/material.dart';


class MobileDashboardScreen extends StatelessWidget {
  const MobileDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.indigo.shade50,
      ),

      drawer: const Drawer(child: MobileAppMenu()),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.indigo,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Row(
              children: [
                Icon(Icons.dashboard_customize, color: Colors.white, size: 32),
                SizedBox(width: 12),
                Flexible(
                  child: Text(
                    'Welcome Back, Admin!',
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
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
            crossAxisCount: 2, 
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.6,
            children: const [
              MobileMetricTile(title: 'Revenue', value: '₹1,24,500', color: Colors.green),
              MobileMetricTile(title: 'Users', value: '2,840', color: Colors.blue),
              MobileMetricTile(title: 'Orders', value: '450', color: Colors.orange),
              MobileMetricTile(title: 'Pending', value: '14', color: Colors.red),
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
    );
  }
}

class MobileAppMenu extends StatelessWidget {
  const MobileAppMenu({super.key});

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

class MobileMetricTile extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  const MobileMetricTile({super.key, required this.title, required this.value, required this.color});

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
