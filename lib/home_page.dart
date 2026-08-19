import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// Model representing an Instagram Post
class PostItem {
  final String username;
  final String userAvatar;
  final String location;
  final String imagePath;
  final String caption;
  final String timeAgo;
  int likes;
  bool isLiked;

  PostItem({
    required this.username,
    required this.userAvatar,
    required this.location,
    required this.imagePath,
    required this.caption,
    required this.timeAgo,
    this.likes = 0,
    this.isLiked = false,
  });
}

class _HomePageState extends State<HomePage> {
  final List<PostItem> posts = [
    PostItem(
      username: 'ashutosh_rai',
      userAvatar: 'assets/images/aws_event.jpg',
      location: 'AWS Community Event • Tech Summit',
      imagePath: 'assets/images/aws_event.jpg',
      caption: 'Had an incredible time attending the AWS event! Explored cloud architectures, AI tools, and networking with fellow engineers. ☁️🚀 #AWS #CloudComputing #TechSummit',
      timeAgo: '2 HOURS AGO',
      likes: 128,
    ),
    PostItem(
      username: 'ashutosh_rai',
      userAvatar: 'assets/images/bba_teaching.jpg',
      location: 'Classroom • Tech Education Series',
      imagePath: 'assets/images/bba_teaching.jpg',
      caption: 'Mentoring BBA students today! Introducing computational thinking, digital tools, and tech fundamentals. 📚✨ #Teaching #StudentEmpowerment #TechEducation',
      timeAgo: '5 HOURS AGO',
      likes: 95,
    ),
    PostItem(
      username: 'ashutosh_rai',
      userAvatar: 'assets/images/bba_team_teaching.jpg',
      location: 'Innovation Lab • Team Workshop',
      imagePath: 'assets/images/bba_team_teaching.jpg',
      caption: 'Team in action! 👥⚡ Our team conducted an interactive session for BBA students explaining what is automation, how modern AI models work, and practical ways to use AI in business. #TeamWork #Automation #AIForBusiness',
      timeAgo: '1 DAY AGO',
      likes: 240,
    ),
    PostItem(
      username: 'ashutosh_rai',
      userAvatar: 'assets/images/mba_teaching.jpg',
      location: 'Management Block • Masterclass',
      imagePath: 'assets/images/mba_teaching.jpg',
      caption: 'Hands-on masterclass with MBA students: teaching workflow automation using n8n! 🔄📈 Connected APIs, automated email workflows, and built self-operating pipelines. #n8n #NoCode #MBAWorkshops #Automation',
      timeAgo: '2 DAYS AGO',
      likes: 385,
    ),
    PostItem(
      username: 'ashutosh_rai',
      userAvatar: 'assets/images/diwali_event.jpg',
      location: 'Campus Celebration • Festive Moments',
      imagePath: 'assets/images/diwali_event.jpg',
      caption: 'Celebrating Diwali with amazing people and colleagues! Wishing everyone light, prosperity, and joy! 🪔✨ #DiwaliCelebration #CampusLife #FestiveVibes',
      timeAgo: '3 DAYS AGO',
      likes: 450,
    ),
  ];

  void _likePost(int index) {
    setState(() {
      posts[index].likes++;
      posts[index].isLiked = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFEFEF), 


      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 450, // Mobile device width
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 20,
                  spreadRadius: 2,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Scaffold(
              backgroundColor: Colors.white,

              // Mobile App Bar (Nicely aligned within mobile width)
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0.5,
                title: const Text(
                  'Instagram',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -0.5,
                    color: Colors.black,
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_border, size: 26, color: Colors.black),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.send_outlined, size: 26, color: Colors.black),
                  ),
                ],
              ),

              // Scrollable Feed
              body: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 1. Profile Header Row
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundImage: AssetImage(post.userAvatar),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    post.username,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    post.location,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.more_vert),
                            ),
                          ],
                        ),
                      ),

                      // 2. Post Image (Actual Photo)
                      Image.asset(
                        post.imagePath,
                        width: double.infinity,
                        height: 380,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: 380,
                            color: Colors.grey.shade200,
                            child: const Center(
                              child: Icon(Icons.image_not_supported, size: 50, color: Colors.grey),
                            ),
                          );
                        },
                      ),

                      // 3. Action Buttons Row (Like, Comment, Share, Save)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                        child: Row(
                          children: [
                            // Like Icon Button
                            IconButton(
                              onPressed: () => _likePost(index),
                              icon: Icon(
                                post.isLiked ? Icons.favorite : Icons.favorite_border,
                                size: 28,
                                color: post.isLiked ? Colors.red : Colors.black,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.chat_bubble_outline, size: 25),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.send_outlined, size: 25),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.bookmark_border, size: 26),
                            ),
                          ],
                        ),
                      ),

                      // 4. Likes Count
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          '${post.likes} likes',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),

                      // 5. Caption
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: RichText(
                          text: TextSpan(
                            style: const TextStyle(color: Colors.black87, fontSize: 14),
                            children: [
                              TextSpan(
                                text: '${post.username} ',
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(text: post.caption),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),

                      // 6. Time ago
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          post.timeAgo,
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey.shade500,
                            letterSpacing: 0.2,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),

                      // 7. Large Interactive "Like" ElevatedButton
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: () => _likePost(index),
                            icon: Icon(
                              Icons.favorite,
                              color: post.isLiked ? Colors.red : Colors.grey,
                              size: 20,
                            ),
                            label: Text(
                              'Like Post (+1)',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: post.isLiked ? Colors.red.shade700 : Colors.black87,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: post.isLiked ? Colors.red.shade50 : Colors.grey.shade100,
                              elevation: 0,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 18),
                      const Divider(height: 1, thickness: 8, color: Color(0xFFF2F2F2)),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}