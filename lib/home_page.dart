import 'package:flutter/material.dart';

// ==========================================
// USER POST MODEL
// ==========================================

class UserPost {
  final String username;
  final String subtitle;
  final String imageUrl;
  final String caption;
  int likes;
  bool isLiked;

  UserPost({
    required this.username,
    required this.subtitle,
    required this.imageUrl,
    required this.caption,
    this.likes = 0,
    this.isLiked = false,
  });
}

// ==========================================
// HOME PAGE
// ==========================================

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // 1 user, 3 posts
  final List<UserPost> posts = [
    UserPost(
      username: 'flutter_student',
      subtitle: 'Mumbai, India',
      imageUrl: 'https://picsum.photos/id/10/600/600',
      caption: 'Learning Flutter one widget at a time! 🚀',
      likes: 12,
    ),
    UserPost(
      username: 'flutter_student',
      subtitle: 'Goa, India',
      imageUrl: 'https://picsum.photos/id/20/600/600',
      caption: 'Widgets are everything in Flutter 🎯',
      likes: 34,
    ),
    UserPost(
      username: 'flutter_student',
      subtitle: 'Delhi, India',
      imageUrl: 'https://picsum.photos/id/30/600/600',
      caption: 'Hot reload is pure magic ✨',
      likes: 58,
    ),
  ];

  // Every tap increases likes by 1 and turns heart red
  void addLike(int index) {
    setState(() {
      posts[index].likes++;
      posts[index].isLiked = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // ==========================================
      // APP BAR
      // ==========================================

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: const Text(
          'Instagram',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border, color: Colors.black),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.send_outlined, color: Colors.black),
          ),
        ],
      ),

      // ==========================================
      // BODY
      // ==========================================

      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return _buildPost(posts[index], index);
        },
      ),
    );
  }

  // ==========================================
  // POST CARD
  // ==========================================

  Widget _buildPost(UserPost post, int index) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // ======================================
          // PROFILE ROW
          // ======================================

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              children: [

                // Avatar with gradient ring
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFf09433),
                        Color(0xFFe6683c),
                        Color(0xFFdc2743),
                        Color(0xFFcc2366),
                        Color(0xFFbc1888),
                      ],
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: const CircleAvatar(
                      radius: 18,
                      backgroundColor: Color(0xFFEEEEEE),
                      child: Icon(Icons.person, size: 20, color: Colors.grey),
                    ),
                  ),
                ),

                const SizedBox(width: 10),

                // Username & location
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.username,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        post.subtitle,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),

                // More options
                const Icon(Icons.more_vert, color: Colors.black),
              ],
            ),
          ),

          // ======================================
          // POST IMAGE
          // ======================================

          GestureDetector(
            onDoubleTap: () => addLike(index),
            child: SizedBox(
              width: double.infinity,
              height: 380,
              child: Image.network(
                post.imageUrl,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    height: 380,
                    color: Colors.grey.shade100,
                    child: const Center(child: CircularProgressIndicator()),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 380,
                    color: Colors.grey.shade100,
                    child: const Center(
                      child: Icon(Icons.broken_image, size: 60, color: Colors.grey),
                    ),
                  );
                },
              ),
            ),
          ),

          // ======================================
          // ACTION BUTTONS
          // ======================================

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              children: [

                // LIKE — tap to increase
                IconButton(
                  onPressed: () => addLike(index),
                  icon: Icon(
                    post.isLiked ? Icons.favorite : Icons.favorite_border,
                    size: 28,
                    color: post.isLiked ? Colors.red : Colors.black,
                  ),
                ),

                // COMMENT
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.chat_bubble_outline,
                    size: 26,
                    color: Colors.black,
                  ),
                ),

                // SHARE
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.send_outlined,
                    size: 26,
                    color: Colors.black,
                  ),
                ),

                const Spacer(),

                // SAVE
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.bookmark_border,
                    size: 26,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),

          // ======================================
          // LIKE COUNT — increases on every tap
          // ======================================

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              transitionBuilder: (child, animation) => SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, -0.4),
                  end: Offset.zero,
                ).animate(animation),
                child: FadeTransition(opacity: animation, child: child),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${post.likes} likes',
                  key: ValueKey(post.likes),
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 6),

          // ======================================
          // CAPTION
          // ======================================

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: RichText(
              text: TextSpan(
                style: const TextStyle(fontSize: 14, color: Colors.black),
                children: [
                  TextSpan(
                    text: '${post.username}  ',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: post.caption),
                ],
              ),
            ),
          ),

          const SizedBox(height: 10),

          // ======================================
          // TIMESTAMP
          // ======================================

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              '2 hours ago',
              style: TextStyle(fontSize: 11, color: Colors.grey),
            ),
          ),

          const SizedBox(height: 12),

          const Divider(height: 1, thickness: 0.3),
        ],
      ),
    );
  }
}
