import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  // Open website
  void openLink(String url) async {
    final link = Uri.parse(url);

    if (await canLaunchUrl(link)) {
      await launchUrl(
        link,
        mode: LaunchMode.externalApplication,
      );
    }
  }

  // Open email
  void openMail() async {
    final email = Uri.parse(
      'mailto:parth@example.com?subject=Hello Parth',
    );

    if (await canLaunchUrl(email)) {
      await launchUrl(email);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 950),
              margin: const EdgeInsets.all(24),
              child: Column(
                children: [

                  // Main profile card
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(28),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xff25134F),
                          Color(0xff40206D),
                          Color(0xff172B55),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(32),
                      border: Border.all(
                        color: const Color(0xffB56CFF),
                        width: 1.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xff9C4DFF).withOpacity(0.3),
                          blurRadius: 30,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [

                        // Online profile photo
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xffFF4ECD),
                                Color(0xff8A5CFF),
                                Color(0xff36D1FF),
                              ],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xffFF4ECD)
                                    .withOpacity(0.4),
                                blurRadius: 25,
                              ),
                            ],
                          ),
                          child: const CircleAvatar(
                            radius: 82,
                            backgroundImage: NetworkImage(
                              'https://images.unsplash.com/photo-1603575448878-868a20723f5d?auto=format&fit=crop&w=800&q=80',
                            ),
                          ),
                        ),

                        const SizedBox(height: 22),

                        // Name
                        const Text(
                          'Parth Sahani',
                          style: TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),

                        const SizedBox(height: 8),

                        // Role
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xffFF4ECD)
                                .withOpacity(0.15),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: const Color(0xffFF4ECD),
                            ),
                          ),
                          child: const Text(
                            'Flutter Developer • Student • Tech Enthusiast',
                            style: TextStyle(
                              color: Color(0xffFFB8EE),
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),

                        const SizedBox(height: 18),

                        const Text(
                          'Building ideas into simple, useful and beautiful digital experiences.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xffD8D1EA),
                            fontSize: 16,
                            height: 1.5,
                          ),
                        ),

                        const SizedBox(height: 25),

                        // Social buttons
                        Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 12,
                          runSpacing: 12,
                          children: [

                            // Instagram
                            socialButton(
                              icon: Icons.camera_alt_outlined,
                              text: 'Instagram',
                              color: const Color(0xffFF4ECD),
                              onTap: () {
                                openLink(
                                  'https://www.instagram.com/',
                                );
                              },
                            ),

                            // Mail
                            socialButton(
                              icon: Icons.email_outlined,
                              text: 'Mail',
                              color: const Color(0xff36D1FF),
                              onTap: openMail,
                            ),

                            // LinkedIn
                            socialButton(
                              icon: Icons.work_outline,
                              text: 'LinkedIn',
                              color: const Color(0xff5B8CFF),
                              onTap: () {
                                openLink(
                                  'https://www.linkedin.com/',
                                );
                              },
                            ),

                            // GitHub
                            socialButton(
                              icon: Icons.code,
                              text: 'GitHub',
                              color: const Color(0xffA878FF),
                              onTap: () {
                                openLink(
                                  'https://github.com/Indianworldruler',
                                );
                              },
                            ),
                          ],
                        ),

                        const SizedBox(height: 30),

                        // Stats
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            profileStat('12+', 'Projects'),
                            profileStat('8+', 'Skills'),
                            profileStat('3+', 'Years Learning'),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 22),

                  // About section
                  sectionCard(
                    icon: Icons.person_outline,
                    title: 'About Me',
                    child: const Text(
                      'I am a student interested in app development, programming and modern technology. I enjoy learning Flutter and Dart, creating user interfaces and trying out new ideas. My main goal is to keep improving my development skills by building real projects.',
                      style: TextStyle(
                        color: Color(0xffD9D3E8),
                        fontSize: 16,
                        height: 1.7,
                      ),
                    ),
                  ),

                  const SizedBox(height: 22),

                  // Skills section
                  sectionCard(
                    icon: Icons.auto_awesome,
                    title: 'My Skills',
                    child: Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        skillChip('Flutter'),
                        skillChip('Dart'),
                        skillChip('Firebase'),
                        skillChip('Python'),
                        skillChip('GitHub'),
                        skillChip('UI Design'),
                        skillChip('REST API'),
                        skillChip('Problem Solving'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 22),

                  // Projects section
                  sectionCard(
                    icon: Icons.rocket_launch_outlined,
                    title: 'Things I Like Building',
                    child: Column(
                      children: [
                        projectItem(
                          Icons.phone_android,
                          'Mobile Applications',
                          'Creating simple Flutter apps with clean and modern interfaces.',
                          const Color(0xffFF4ECD),
                        ),
                        projectItem(
                          Icons.cloud_outlined,
                          'Firebase Projects',
                          'Working with authentication, databases and real-time application features.',
                          const Color(0xff36D1FF),
                        ),
                        projectItem(
                          Icons.dashboard_outlined,
                          'Creative UI Designs',
                          'Designing dashboards, profile pages and attractive application screens.',
                          const Color(0xffA878FF),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 22),

                  // Learning section
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xff3A1B5E),
                          Color(0xff192F5A),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(28),
                      border: Border.all(
                        color: const Color(0xff5B8CFF),
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: const Color(0xff36D1FF)
                                .withOpacity(0.15),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: const Icon(
                            Icons.lightbulb_outline,
                            color: Color(0xff36D1FF),
                            size: 32,
                          ),
                        ),
                        const SizedBox(width: 18),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Currently Learning',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                'Flutter • Firebase • Advanced Dart • Better UI Design',
                                style: TextStyle(
                                  color: Color(0xffCFC8E2),
                                  fontSize: 14,
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 22),

                  // Contact section
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      color: const Color(0xff17122D),
                      borderRadius: BorderRadius.circular(28),
                      border: Border.all(
                        color: const Color(0xff713B9E),
                      ),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'Let’s Connect',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Have an idea or just want to say hello?',
                          style: TextStyle(
                            color: Color(0xffBEB5D3),
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 18),
                        ElevatedButton.icon(
                          onPressed: openMail,
                          icon: const Icon(Icons.send_outlined),
                          label: const Text(
                            'Send Me a Message',
                            style: TextStyle(fontSize: 16),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xffFF4ECD),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 25,
                              vertical: 15,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 15),

                  const Text(
                    'Made with Flutter & creativity ✨',
                    style: TextStyle(
                      color: Color(0xff77718A),
                      fontSize: 13,
                    ),
                  ),

                  const SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Profile statistics
  Widget profileStat(String number, String title) {
    return Column(
      children: [
        Text(
          number,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          title,
          style: const TextStyle(
            color: Color(0xffBDB5D2),
            fontSize: 13,
          ),
        ),
      ],
    );
  }

  // Social button
  Widget socialButton({
    required IconData icon,
    required String text,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: color.withOpacity(0.12),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: color.withOpacity(0.7),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: color,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              text,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Section card
  Widget sectionCard({
    required IconData icon,
    required String title,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: const Color(0xff17122D),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: const Color(0xff352653),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 18,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xffFF4ECD),
                      Color(0xff8A5CFF),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 14),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          child,
        ],
      ),
    );
  }

  // Skill chip
  Widget skillChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xff8A5CFF).withOpacity(0.25),
            const Color(0xff36D1FF).withOpacity(0.12),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xff7652B7),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xffE7E0F8),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  // Project item
  Widget projectItem(
    IconData icon,
    String title,
    String description,
    Color color,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.07),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: color.withOpacity(0.25),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.15),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(
              icon,
              color: color,
              size: 26,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: const TextStyle(
                    color: Color(0xffBDB5D2),
                    fontSize: 14,
                    height: 1.5,
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