import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool notifications = true;
  bool automaticUpdates = true;
  bool compactMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        backgroundColor: const Color(0xFF203A5F),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF203A5F),
                  Color(0xFF39756B),
                ],
              ),
              borderRadius: BorderRadius.circular(28),
            ),
            child: const Row(
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundColor: Color(0xFFE9C46A),
                  child: Icon(
                    Icons.person_rounded,
                    color: Color(0xFF203A5F),
                    size: 32,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Parth Sahani',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 21,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Dashboard Administrator',
                        style: TextStyle(
                          color: Color(0xFFD8E2E8),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 22),
          _settingCard(
            'Notifications',
            'Receive updates about your dashboard',
            Icons.notifications_rounded,
            notifications,
            (value) {
              setState(() {
                notifications = value;
              });
            },
          ),
          _settingCard(
            'Automatic Updates',
            'Keep dashboard information refreshed',
            Icons.sync_rounded,
            automaticUpdates,
            (value) {
              setState(() {
                automaticUpdates = value;
              });
            },
          ),
          _settingCard(
            'Compact Mode',
            'Use smaller cards and tighter spacing',
            Icons.view_compact_rounded,
            compactMode,
            (value) {
              setState(() {
                compactMode = value;
              });
            },
          ),
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: const Color(0xFFD9E0EA),
              ),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'SYSTEM',
                  style: TextStyle(
                    color: Color(0xFF78879A),
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
                SizedBox(height: 18),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(
                    Icons.security_rounded,
                    color: Color(0xFF203A5F),
                  ),
                  title: Text(
                    'Security',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'Your account is protected',
                  ),
                  trailing: Icon(
                    Icons.chevron_right_rounded,
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(
                    Icons.info_outline_rounded,
                    color: Color(0xFFC76D52),
                  ),
                  title: Text(
                    'About Nebula',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'Dashboard version 1.0.0',
                  ),
                  trailing: Icon(
                    Icons.chevron_right_rounded,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _settingCard(
    String title,
    String subtitle,
    IconData icon,
    bool value,
    ValueChanged<bool> onChanged,
  ) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: value
              ? const Color(0xFFE9C46A)
              : const Color(0xFFD9E0EA),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A203A5F),
            blurRadius: 15,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0x14203A5F),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF203A5F),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF162238),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Color(0xFF78879A),
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: const Color(0xFF39756B),
            activeTrackColor: const Color(0xFFB8DED4),
          ),
        ],
      ),
    );
  }
}