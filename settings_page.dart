import 'package:flutter/material.dart';
import 'foodapp.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool orderNotifications = true;
  bool zenAmbience = true;
  bool gpsLocation = true;
  bool chopstickIncluded = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: JapaneseTheme.creamBg,
      appBar: AppBar(
        backgroundColor: JapaneseTheme.toriiCrimson,
        foregroundColor: Colors.white,
        title: const Text('Parth’s Preferences (環境設定)'),
      ),
      body: TempleAnimatedBackground(
        child: ListView(
          padding: const EdgeInsets.all(18),
          children: [
            // User Profile Hero Card
            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF85191C),
                    JapaneseTheme.toriiCrimson,
                  ],
                ),
                borderRadius: BorderRadius.circular(22),
                border: Border.all(
                  color: JapaneseTheme.goldAccent,
                  width: 1.5,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 58,
                    height: 58,
                    decoration: BoxDecoration(
                      color: JapaneseTheme.washiPaper,
                      shape: BoxShape.circle,
                      border: Border.all(color: JapaneseTheme.goldAccent, width: 2),
                    ),
                    child: const Center(
                      child: Text(
                        'P',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: JapaneseTheme.toriiCrimson,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Parth Sahani',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          'parth@foodhub.com • VIP Gold Diner',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 22),

            Row(
              children: const [
                Icon(Icons.room_service_outlined, color: JapaneseTheme.toriiCrimson, size: 20),
                SizedBox(width: 8),
                Text(
                  'Dining Preferences (お好み設定)',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: JapaneseTheme.inkBlack,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            _buildSwitchTile(
              title: 'Order Status Alerts (配達通知)',
              subtitle: 'Live kitchen & courier tracking notifications',
              icon: Icons.notifications_active_outlined,
              value: orderNotifications,
              onChanged: (val) => setState(() => orderNotifications = val),
            ),

            _buildSwitchTile(
              title: 'Sakura Petal Background (桜アニメーション)',
              subtitle: 'Enable peaceful floating cherry blossoms',
              icon: Icons.filter_vintage_outlined,
              value: zenAmbience,
              onChanged: (val) => setState(() => zenAmbience = val),
            ),

            _buildSwitchTile(
              title: 'Eco Bamboo Chopsticks (お箸)',
              subtitle: 'Include complimentary wooden chopsticks with orders',
              icon: Icons.flatware_outlined,
              value: chopstickIncluded,
              onChanged: (val) => setState(() => chopstickIncluded = val),
            ),

            _buildSwitchTile(
              title: 'Live Location GPS (お届け先)',
              subtitle: 'Accurate delivery to Parth’s current address',
              icon: Icons.location_on_outlined,
              value: gpsLocation,
              onChanged: (val) => setState(() => gpsLocation = val),
            ),

            const SizedBox(height: 22),

            Row(
              children: const [
                Icon(Icons.manage_accounts_outlined, color: JapaneseTheme.toriiCrimson, size: 20),
                SizedBox(width: 8),
                Text(
                  'Account & Addresses (配送先)',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: JapaneseTheme.inkBlack,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            _buildActionTile(
              title: 'Saved Delivery Addresses (住所一覧)',
              subtitle: 'Home: Flat 402, Sakura Residency',
              icon: Icons.home_outlined,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: JapaneseTheme.toriiCrimson,
                    content: Text('Primary Address: Flat 402, Sakura Residency'),
                  ),
                );
              },
            ),

            _buildActionTile(
              title: 'Payment Methods & UPI (お支払い)',
              subtitle: 'Google Pay • UPI • Cash on Delivery',
              icon: Icons.payment_outlined,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: JapaneseTheme.toriiCrimson,
                    content: Text('Primary UPI linked: parth@upi'),
                  ),
                );
              },
            ),

            _buildActionTile(
              title: 'Customer Concierge (おもてなしサポート)',
              subtitle: 'Need help with an order or dietary question?',
              icon: Icons.support_agent_outlined,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: JapaneseTheme.toriiCrimson,
                    content: Text('Connecting to Japanese Support Concierge...'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSwitchTile({
    required String title,
    required String subtitle,
    required IconData icon,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.95),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: JapaneseTheme.borderLight,
        ),
      ),
      child: SwitchListTile(
        activeThumbColor: JapaneseTheme.toriiCrimson,
        activeTrackColor: JapaneseTheme.vermilionLight,
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: JapaneseTheme.inkBlack),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(fontSize: 12, color: JapaneseTheme.stoneGrey),
        ),
        secondary: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: JapaneseTheme.vermilionLight,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            color: JapaneseTheme.toriiCrimson,
            size: 22,
          ),
        ),
        value: value,
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildActionTile({
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.95),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: JapaneseTheme.borderLight,
        ),
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: JapaneseTheme.vermilionLight,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            color: JapaneseTheme.toriiCrimson,
            size: 22,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: JapaneseTheme.inkBlack,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
            fontSize: 12,
            color: JapaneseTheme.stoneGrey,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 14,
          color: JapaneseTheme.stoneGrey,
        ),
        onTap: onTap,
      ),
    );
  }
}