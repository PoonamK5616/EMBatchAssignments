import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<bool> liked = [false, false, false];

  final List<int> likes = [10, 24, 18];

  void toggleLike(int index) {
    setState(() {
      if (liked[index]) {
        likes[index]--;
        liked[index] = false;
      } else {
        likes[index]++;
        liked[index] = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar shows the Instagram heading and top icons.
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Instagram',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.send_outlined),
          ),
        ],
      ),

      // The body contains all three posts in a vertical feed.
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 600,
            ),
            child: Column(
              children: [
                buildPost(
                  index: 0,
                  username: 'flutter_student',
                  description: 'Learning Flutter',
                  caption:
                      'Learning Flutter one widget at a time! 🚀',
                  icon: Icons.flutter_dash,
                  colours: const [
                    Color(0xFFFFD54F),
                    Color(0xFFFF7043),
                    Color(0xFFE91E63),
                    Color(0xFF673AB7),
                  ],
                ),

                buildPost(
                  index: 1,
                  username: 'coding_student',
                  description: 'Building my app',
                  caption:
                      'Creating my first Flutter social media app! 💻',
                  icon: Icons.code,
                  colours: const [
                    Color(0xFF42A5F5),
                    Color(0xFF26C6DA),
                    Color(0xFF7E57C2),
                    Color(0xFFEC407A),
                  ],
                ),

                buildPost(
                  index: 2,
                  username: 'tech_learner',
                  description: 'Flutter Developer',
                  caption:
                      'Widgets make Flutter development simple! ✨',
                  icon: Icons.phone_android,
                  colours: const [
                    Color(0xFF66BB6A),
                    Color(0xFF26A69A),
                    Color(0xFF29B6F6),
                    Color(0xFF5C6BC0),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // This creates one complete Instagram-style post.
  Widget buildPost({
    required int index,
    required String username,
    required String description,
    required String caption,
    required IconData icon,
    required List<Color> colours,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Profile section shows the user details and follow button.
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 2),
                ),
                child: const Icon(
                  Icons.person,
                  size: 28,
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      username,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),

              OutlinedButton(
                onPressed: () {},
                child: const Text('Follow'),
              ),
            ],
          ),
        ),

        // Square area represents the post image.
        AspectRatio(
          aspectRatio: 1,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: colours,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    size: 90,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Flutter',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Build beautiful apps',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        // These icons provide the main post actions.
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 5,
          ),
          child: Row(
            children: [
              IconButton(
                onPressed: () => toggleLike(index),
                icon: Icon(
                  liked[index]
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: liked[index] ? Colors.red : Colors.black,
                  size: 28,
                ),
              ),

              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.chat_bubble_outline,
                  size: 27,
                ),
              ),

              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.send_outlined,
                  size: 27,
                ),
              ),

              const Spacer(),

              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.bookmark_border,
                  size: 27,
                ),
              ),
            ],
          ),
        ),

        // This displays the current number of likes.
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            '${likes[index]} likes',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        const SizedBox(height: 6),

        // This displays the post caption.
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: RichText(
            text: TextSpan(
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
              children: [
                TextSpan(
                  text: '$username ',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(text: caption),
              ],
            ),
          ),
        ),

        const SizedBox(height: 12),

        // This button lets the user like or unlike the post.
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () => toggleLike(index),
              icon: Icon(
                liked[index]
                    ? Icons.favorite
                    : Icons.favorite_border,
              ),
              label: Text(
                liked[index] ? 'Liked' : 'Like this post',
              ),
            ),
          ),
        ),

        const SizedBox(height: 25),
      ],
    );
  }
}