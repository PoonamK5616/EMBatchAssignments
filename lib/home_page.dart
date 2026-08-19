import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool isLiked = false;
  bool isLiked2 = false;
  bool isLiked3 = false;

  int likes = 0;

  void toggleLike1() {
    setState(() {
      isLiked = !isLiked;
    });
  }

  void toggleLike2() {
    setState(() {
      isLiked2 = !isLiked2;
    });
  }

  void toggleLike3() {
    setState(() {
      isLiked3 = !isLiked3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // ==========================================
      // APP BAR
      // ==========================================

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

            icon: const Icon(
              Icons.favorite_border,
            ),
          ),

          IconButton(
            onPressed: () {},

            icon: const Icon(
              Icons.send_outlined,
            ),
          ),
        ],
      ),

      // ==========================================
      // BODY
      // ==========================================

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            // ======================================
            // PROFILE SECTION
            // ======================================

            Padding(
              padding: const EdgeInsets.all(16),

              child: Row(
                children: [

                  // Profile Icon
                  Container(
                    width: 50,
                    height: 50,

                    decoration: BoxDecoration(
                      shape: BoxShape.circle,

                      border: Border.all(
                        width: 2,
                      ),
                    ),

                    child: const Icon(
                      Icons.person,
                      size: 30,
                    ),
                  ),

                  const SizedBox(width: 12),

                  // Username
                  const Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: [

                        Text(
                          'aachal the great',

                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 3),

                        Text(
                          'teaching people how to live',

                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Follow Button
                  ElevatedButton(
                    onPressed: () {},

                    child: const Text(
                      'Follow',
                    ),
                  ),
                ],
              ),
            ),

// ======================================
// POST 1
// ======================================

Center(
  child: SizedBox(
    width: 500,
    height: 625,
    child: Image.asset(
      'assets/my_photo.jpeg',
      fit: BoxFit.contain,
    ),
  ),
),

// ======================================
// POST 1 ACTIONS
// ======================================

Padding(
  padding: const EdgeInsets.symmetric(
    horizontal: 12,
    vertical: 8,
  ),
  child: Row(
    children: [
      // LIKE POST 1
      IconButton(
        onPressed: toggleLike1,
        icon: Icon(
          isLiked
              ? Icons.favorite
              : Icons.favorite_border,
          size: 30,
          color: isLiked
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

const Padding(
  padding: EdgeInsets.symmetric(horizontal: 16),
  child: Text(
    'follow for more content like this 🚀',
    style: TextStyle(fontSize: 16),
  ),
),

const SizedBox(height: 20),

// ======================================
// POST 2
// ======================================

Center(
  child: SizedBox(
    width: 500,
    height: 625,
    child: Image.asset(
      'assets/2.jpeg',
      fit: BoxFit.contain,
    ),
  ),
),

// ======================================
// POST 2 ACTIONS
// ======================================

Padding(
  padding: const EdgeInsets.symmetric(
    horizontal: 12,
    vertical: 8,
  ),
  child: Row(
    children: [
      // LIKE POST 2
      IconButton(
        onPressed: toggleLike2,
        icon: Icon(
          isLiked2
              ? Icons.favorite
              : Icons.favorite_border,
          size: 30,
          color: isLiked2
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

const Padding(
  padding: EdgeInsets.symmetric(horizontal: 16),
  child: Text(
    'My photo is definitely not AI generated ❤️',
    style: TextStyle(fontSize: 16),
  ),
),

const SizedBox(height: 20),

// ======================================
// POST 3
// ======================================

Center(
  child: SizedBox(
    width: 500,
    height: 625,
    child: Image.asset(
      'assets/3.jpeg',
      fit: BoxFit.contain,
    ),
  ),
),

// ======================================
// POST 3 ACTIONS
// ======================================

Padding(
  padding: const EdgeInsets.symmetric(
    horizontal: 12,
    vertical: 8,
  ),
  child: Row(
    children: [
      // LIKE POST 3
      IconButton(
        onPressed: toggleLike3,
        icon: Icon(
          isLiked3
              ? Icons.favorite
              : Icons.favorite_border,
          size: 30,
          color: isLiked3
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

const Padding(
  padding: EdgeInsets.symmetric(horizontal: 16),
  child: Text(
    'Just enjoying a little snack break 🥪❤️',
    style: TextStyle(fontSize: 16),
  ),
),

const SizedBox(height: 20),

// ======================================
// LIKE COUNT
// ======================================

Padding(
  padding: const EdgeInsets.symmetric(
    horizontal: 16,
  ),
  child: Text(
    '$likes likes',
    style: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
  ),
),

const SizedBox(height: 8),

// ======================================
// CAPTION
// ======================================

const Padding(
  padding: EdgeInsets.symmetric(
    horizontal: 16,
  ),
  child: Text(
    'flutter_student '
    'Learning Flutter one widget at a time! 🚀',
    style: TextStyle(
      fontSize: 15,
    ),
  ),
),

const SizedBox(height: 20),

// ======================================
// LIKE BUTTON
// ======================================

Padding(
  padding: const EdgeInsets.symmetric(
    horizontal: 16,
  ),
  child: SizedBox(
    width: double.infinity,
    child: ElevatedButton.icon(
      onPressed: toggleLike1,
      icon: Icon(
        isLiked
            ? Icons.favorite
            : Icons.favorite_border,
      ),
      label: Text(
        isLiked
            ? 'Liked'
            : 'Like this post',
      ),
    ),
  ),
),

const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}