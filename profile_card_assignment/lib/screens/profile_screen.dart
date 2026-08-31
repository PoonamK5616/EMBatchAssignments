import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class ProfileCardScreen extends StatefulWidget {
  const ProfileCardScreen({super.key});
  @override
  State<ProfileCardScreen> createState() => _ProfileCardScreenState();
}

class _ProfileCardScreenState extends State<ProfileCardScreen> {
  bool _isFollowing = false;
  int _followers = 1240;
  bool _isBookmarked = false;

  void _toggleFollow() {
    setState(() {
      _isFollowing = !_isFollowing;
      _followers += _isFollowing ? 1 : -1;
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: _isFollowing ? AppColors.accentEmerald : AppColors.primaryDark,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      content: Row(children: [
        Icon(_isFollowing ? Icons.check_circle_rounded : Icons.info_outline_rounded, color: Colors.white, size: 20),
        const SizedBox(width: 10),
        Text(_isFollowing ? 'You are now following Ashutosh Rai!' : 'Unfollowed Ashutosh Rai',
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
      ]),
      duration: const Duration(seconds: 2),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text('Profile Card', style: TextStyle(color: AppColors.textPrimary, fontSize: 20, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: Icon(_isBookmarked ? Icons.bookmark_rounded : Icons.bookmark_border_rounded,
                color: _isBookmarked ? AppColors.accentAmber : AppColors.textSecondary),
            onPressed: () => setState(() => _isBookmarked = !_isBookmarked),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(gradient: AppColors.backgroundGradient),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: _buildProfileCard(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileCard() {
    return Container(
      constraints: const BoxConstraints(maxWidth: 420),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: AppColors.cardBorder, width: 1.5),
        boxShadow: [
          BoxShadow(color: AppColors.primary.withValues(alpha: 0.12), blurRadius: 24, offset: const Offset(0, 8)),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildBanner(),
          const SizedBox(height: 52),
          _buildUserInfo(),
          const SizedBox(height: 14),
          _buildBio(),
          const SizedBox(height: 16),
          _buildSkills(),
          const SizedBox(height: 16),
          const Divider(height: 1, color: AppColors.dividerColor, indent: 24, endIndent: 24),
          const SizedBox(height: 16),
          _buildStats(),
          const SizedBox(height: 16),
          _buildContactBox(),
          const SizedBox(height: 20),
          _buildButtons(),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildBanner() {
    return Container(
      height: 96,
      decoration: const BoxDecoration(
        gradient: AppColors.headerGradient,
        borderRadius: BorderRadius.vertical(top: Radius.circular(26)),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 12, right: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.25),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white.withValues(alpha: 0.4)),
              ),
              child: const Row(mainAxisSize: MainAxisSize.min, children: [
                Icon(Icons.circle, color: AppColors.accentEmerald, size: 8),
                SizedBox(width: 6),
                Text('Available for hire', style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600)),
              ]),
            ),
          ),
          Positioned(
            bottom: -45, left: 0, right: 0,
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: AppColors.avatarBorderGradient,
                  boxShadow: [BoxShadow(color: AppColors.primary.withValues(alpha: 0.25), blurRadius: 16, offset: const Offset(0, 4))],
                ),
                child: Container(
                  padding: const EdgeInsets.all(3),
                  decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.surface),
                  child: const CircleAvatar(
                    radius: 42,
                    backgroundColor: AppColors.primaryUltraLight,
                    child: Icon(Icons.person_rounded, size: 46, color: AppColors.primary),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserInfo() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('Ashutosh Rai', style: TextStyle(color: AppColors.textPrimary, fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(width: 6),
          Icon(Icons.verified_rounded, color: AppColors.primary, size: 22),
        ]),
        SizedBox(height: 4),
        Text('Flutter & Mobile App Developer', style: TextStyle(color: AppColors.primary, fontSize: 14.5, fontWeight: FontWeight.w600)),
        SizedBox(height: 6),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(Icons.location_on_rounded, color: AppColors.accentRose, size: 16),
          SizedBox(width: 4),
          Text('Navi Mumbai, India', style: TextStyle(color: AppColors.textSecondary, fontSize: 13, fontWeight: FontWeight.w500)),
        ]),
      ]),
    );
  }

  Widget _buildBio() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.primaryUltraLight.withValues(alpha: 0.35),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.cardBorder.withValues(alpha: 0.6)),
        ),
        child: const Text(
          'Passionate software engineer building high-performance, delightful cross-platform mobile apps with Flutter & Dart. And help of my poonam mam',
          textAlign: TextAlign.center,
          style: TextStyle(color: AppColors.textSecondary, fontSize: 13.5, height: 1.45),
        ),
      ),
    );
  }

  Widget _buildSkills() {
    final skills = [
      {'icon': Icons.flutter_dash_rounded, 'name': 'Flutter', 'color': AppColors.primary, 'bg': AppColors.primaryUltraLight},
      {'icon': Icons.code_rounded, 'name': 'Dart', 'color': AppColors.accentIndigo, 'bg': const Color(0xFFEEF2FF)},
      {'icon': Icons.cloud_done_rounded, 'name': 'Firebase', 'color': AppColors.accentAmber, 'bg': const Color(0xFFFEF3C7)},
      {'icon': Icons.architecture_rounded, 'name': 'Backend', 'color': AppColors.accentRose, 'bg': const Color(0xFFFFE4E6)},
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: skills.map((s) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: s['bg'] as Color,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: (s['color'] as Color).withValues(alpha: 0.35)),
          ),
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            Icon(s['icon'] as IconData, size: 14, color: s['color'] as Color),
            const SizedBox(width: 5),
            Text(s['name'] as String, style: TextStyle(color: s['color'] as Color, fontSize: 12, fontWeight: FontWeight.bold)),
          ]),
        )).toList(),
      ),
    );
  }

  Widget _buildStats() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        _stat('38+', 'Projects', Icons.folder_special_rounded, AppColors.primary),
        const SizedBox(height: 30, child: VerticalDivider(width: 1, color: AppColors.dividerColor)),
        _stat('$_followers', 'Followers', Icons.people_alt_rounded, AppColors.accentIndigo),
        const SizedBox(height: 30, child: VerticalDivider(width: 1, color: AppColors.dividerColor)),
        _stat('4.9', 'Rating', Icons.star_rounded, AppColors.accentAmber),
      ]),
    );
  }

  Widget _stat(String count, String label, IconData icon, Color color) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Row(mainAxisSize: MainAxisSize.min, children: [
        Icon(icon, size: 16, color: color),
        const SizedBox(width: 4),
        Text(count, style: const TextStyle(color: AppColors.textPrimary, fontSize: 18, fontWeight: FontWeight.bold)),
      ]),
      const SizedBox(height: 3),
      Text(label, style: const TextStyle(color: AppColors.textSecondary, fontSize: 12, fontWeight: FontWeight.w500)),
    ]);
  }

  Widget _buildContactBox() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.primaryUltraLight.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.cardBorder.withValues(alpha: 0.7)),
        ),
        child: Column(children: [
          _contactTile(Icons.email_outlined, 'Email', '2024.pashutosh@isu.ac.in', AppColors.primary),
          const SizedBox(height: 8),
          _contactTile(Icons.phone_outlined, 'Phone', '+91 98765 43210', AppColors.accentEmerald),
          const SizedBox(height: 8),
          _contactTile(Icons.link_rounded, 'GitHub', 'github.com/Ashurai84', AppColors.accentIndigo),
        ]),
      ),
    );
  }

  Widget _contactTile(IconData icon, String label, String value, Color color) {
    return Row(children: [
      Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(color: color.withValues(alpha: 0.12), borderRadius: BorderRadius.circular(8)),
        child: Icon(icon, size: 16, color: color),
      ),
      const SizedBox(width: 10),
      Text('$label: ', style: const TextStyle(color: AppColors.textSecondary, fontSize: 12, fontWeight: FontWeight.w600)),
      Expanded(child: Text(value, overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: AppColors.textPrimary, fontSize: 12.5, fontWeight: FontWeight.w500))),
    ]);
  }

  Widget _buildButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(children: [
        Expanded(
          flex: 3,
          child: InkWell(
            onTap: _toggleFollow,
            borderRadius: BorderRadius.circular(16),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 13),
              decoration: BoxDecoration(
                gradient: _isFollowing ? const LinearGradient(colors: [AppColors.accentEmerald, Color(0xFF059669)]) : AppColors.buttonGradient,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(color: (_isFollowing ? AppColors.accentEmerald : AppColors.primary).withValues(alpha: 0.3), blurRadius: 10, offset: const Offset(0, 4)),
                ],
              ),
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(_isFollowing ? Icons.check_rounded : Icons.person_add_alt_1_rounded, color: Colors.white, size: 18),
                const SizedBox(width: 8),
                Text(_isFollowing ? 'Following' : 'Follow', style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
              ]),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 2,
          child: InkWell(
            onTap: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Opening chat with Ashutosh Rai...'), duration: Duration(seconds: 1))),
            borderRadius: BorderRadius.circular(16),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 13),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.cardBorder, width: 1.5),
              ),
              child: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(Icons.chat_bubble_outline_rounded, color: AppColors.primary, size: 17),
                SizedBox(width: 6),
                Text('Message', style: TextStyle(color: AppColors.primary, fontSize: 13.5, fontWeight: FontWeight.w600)),
              ]),
            ),
          ),
        ),
      ]),
    );
  }
}
