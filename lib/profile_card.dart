import 'package:flutter/material.dart';

class ProfileCardPage extends StatelessWidget {
  const ProfileCardPage({super.key});

  static const Color navy = Color(0xFF172554);
  static const Color blue = Color(0xFF2563EB);
  static const Color sky = Color(0xFFE0F2FE);
  static const Color ink = Color(0xFF172033);
  static const Color muted = Color(0xFF64748B);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: sky,
      appBar: AppBar(
        backgroundColor: navy,
        foregroundColor: Colors.white,
        title: const Text('Profile Card'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            tooltip: 'More options',
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Container(
              constraints: const BoxConstraints(maxWidth: 420),
              padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x26172554),
                    blurRadius: 24,
                    offset: Offset(0, 12),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircleAvatar(
                    radius: 54,
                    backgroundColor: blue,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person, size: 64, color: blue),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Gaurav Kulkarni',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ink,
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Flutter Developer',
                    style: TextStyle(
                      color: blue,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 18),
                  const Text(
                    'Building thoughtful mobile experiences while learning every day.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: muted, fontSize: 14, height: 1.5),
                  ),
                  const SizedBox(height: 26),
                  const Divider(color: Color(0xFFE2E8F0)),
                  const SizedBox(height: 18),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _ProfileStat(value: '12', label: 'Projects'),
                      _ProfileStat(value: '2.4K', label: 'Followers'),
                      _ProfileStat(value: '180', label: 'Following'),
                    ],
                  ),
                  const SizedBox(height: 26),
                  const _ProfileDetail(
                    icon: Icons.location_on_outlined,
                    text: 'Pune, India',
                  ),
                  const SizedBox(height: 12),
                  const _ProfileDetail(
                    icon: Icons.email_outlined,
                    text: 'gaurav@example.com',
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.person_add_alt_1),
                      label: const Text('Connect'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: blue,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ProfileStat extends StatelessWidget {
  const _ProfileStat({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: ProfileCardPage.navy,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(color: ProfileCardPage.muted, fontSize: 12),
        ),
      ],
    );
  }
}

class _ProfileDetail extends StatelessWidget {
  const _ProfileDetail({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(9),
          decoration: BoxDecoration(
            color: ProfileCardPage.sky,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: ProfileCardPage.blue, size: 20),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              color: ProfileCardPage.ink,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
