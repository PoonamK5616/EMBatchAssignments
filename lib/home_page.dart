import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // ==========================================
  // POST DATA
  // ==========================================

  final List<int> likes = [120, 85, 245];

  final List<bool> isLiked = [false, false, false];

  final List<String> postImages = [
    'assets/images/IMG_1952.jpg',
    'assets/images/IMG_1951.jpg',
    'assets/images/IMG_7970.jpeg',
  ];

  final List<String> captions = [
    'Learning Flutter one widget at a time! 🚀',
    'Building beautiful apps with Flutter ❤️',
    'My Flutter journey continues! 💙',
  ];

  // ==========================================
  // LIKE POST
  // ==========================================

  void toggleLike(int index) {
    setState(() {
      if (isLiked[index]) {
        likes[index]--;
        isLiked[index] = false;
      } else {
        likes[index]++;
        isLiked[index] = true;
      }
    });
  }

  // ==========================================
  // BUILD
  // ==========================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // ========================================
      // APP BAR
      // ========================================

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

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
            icon: const Icon(
              Icons.favorite_border,
              color: Colors.black,
            ),
          ),

          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.send_outlined,
              color: Colors.black,
            ),
          ),
        ],
      ),

      // ========================================
      // BODY
      // ========================================

      body: ListView.builder(
        itemCount: 3,

        itemBuilder: (context, index) {
          return buildPost(index);
        },
      ),
    );
  }

  // ==========================================
  // POST WIDGET
  // ==========================================

  Widget buildPost(int index) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 500),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

      children: [

        // ======================================
        // PROFILE HEADER
        // ======================================

        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 10,
          ),

          child: Row(
            children: [

              // Profile picture
              Container(
                width: 42,
                height: 42,

                decoration: BoxDecoration(
                  shape: BoxShape.circle,

                  border: Border.all(
                    width: 2,
                  ),
                ),

                child: const Icon(
                  Icons.person,
                  size: 25,
                ),
              ),

              const SizedBox(width: 10),

              // Username
              const Expanded(
                child: Text(
                  'flutter_student',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // More button
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert,
                ),
              ),
            ],
          ),
        ),

        // ======================================
        // INSTAGRAM-SIZE POST
        // ======================================

        AspectRatio(
          aspectRatio: 4 / 5,

          child: Image.asset(
            postImages[index],
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),

        // ======================================
        // ACTION BUTTONS
        // ======================================

        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
          ),

          child: Row(
            children: [

              // LIKE
              IconButton(
                onPressed: () {
                  toggleLike(index);
                },

                icon: Icon(
                  isLiked[index]
                      ? Icons.favorite
                      : Icons.favorite_border,

                  size: 30,

                  color: isLiked[index]
                      ? Colors.red
                      : Colors.black,
                ),
              ),

              // COMMENT
              IconButton(
                onPressed: () {},

                icon: const Icon(
                  Icons.chat_bubble_outline,
                  size: 28,
                ),
              ),

              // SHARE
              IconButton(
                onPressed: () {},

                icon: const Icon(
                  Icons.send_outlined,
                  size: 28,
                ),
              ),

              const Spacer(),

              // SAVE
              IconButton(
                onPressed: () {},

                icon: const Icon(
                  Icons.bookmark_border,
                  size: 28,
                ),
              ),
            ],
          ),
        ),

        // ======================================
        // LIKE COUNT
        // ======================================

        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),

          child: Text(
            '${likes[index]} likes',

            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        const SizedBox(height: 6),

        // ======================================
        // CAPTION
        // ======================================

        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),

          child: RichText(
            text: TextSpan(
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),

              children: [
                const TextSpan(
                  text: 'flutter_student ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                TextSpan(
                  text: captions[index],
                ),
              ],
            ),
          ),
        ),

        // ======================================
        // SPACING BETWEEN POSTS
        // ======================================

        const SizedBox(height: 30),
        ],
      ),
      ),
    );
  }
}