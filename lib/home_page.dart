import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // =========================================================
  // USER 1 - ORIGINAL
  // =========================================================

  int likes = 0;
  bool isLiked = false;

  void toggleLike() {
    setState(() {
      if (isLiked) {
        likes--;
        isLiked = false;
      } else {
        likes++;
        isLiked = true;
      }
    });
  }

  // =========================================================
  // USER 2
  // =========================================================

  int likes2 = 0;

  void addLike2() {
    setState(() {
      likes2++;
    });
  }

  // =========================================================
  // USER 3
  // =========================================================

  int likes3 = 0;

  void addLike3() {
    setState(() {
      likes3++;
    });
  }

  // =========================================================
  // USER 4
  // =========================================================

  int likes4 = 0;

  void addLike4() {
    setState(() {
      likes4++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // =========================================================
      // APP BAR
      // =========================================================

      appBar: AppBar(
        backgroundColor: Colors.white,

        title: const Text(
          'Instagram',
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),

        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border)),

          IconButton(onPressed: () {}, icon: const Icon(Icons.send_outlined)),
        ],
      ),

      // =========================================================
      // BODY
      // =========================================================
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            // =====================================================
            // USER 1 - PROFILE
            // =====================================================

            Padding(
              padding: const EdgeInsets.all(16),

              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,

                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 2),
                    ),

                    child: const Icon(Icons.person, size: 30),
                  ),

                  const SizedBox(width: 12),

                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text(
                          'flutter_student',

                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 3),

                        Text(
                          'Learning Flutter',

                          style: TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                  ),

                  ElevatedButton(onPressed: () {}, child: const Text('Follow')),
                ],
              ),
            ),

            // =====================================================
            // USER 1 - POST
            // =====================================================
            Container(
              width: double.infinity,
              height: 350,

              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,

                  colors: [
                    Color(0xFFFFD54F),
                    Color(0xFFFF7043),
                    Color(0xFFE91E63),
                    Color(0xFF673AB7),
                  ],
                ),
              ),

              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Icon(Icons.flutter_dash, size: 100, color: Colors.white),

                    SizedBox(height: 15),

                    Text(
                      'Flutter',

                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 5),

                    Text(
                      'Build beautiful apps',

                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),

            // =====================================================
            // USER 1 - POST ACTIONS
            // =====================================================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),

              child: Row(
                children: [
                  IconButton(
                    onPressed: toggleLike,

                    icon: Icon(
                      isLiked ? Icons.favorite : Icons.favorite_border,

                      size: 30,

                      color: isLiked ? Colors.red : Colors.black,
                    ),
                  ),

                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.chat_bubble_outline, size: 28),
                  ),

                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.send_outlined, size: 28),
                  ),

                  const Spacer(),

                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.bookmark_border, size: 28),
                  ),
                ],
              ),
            ),

            // USER 1 - LIKE COUNT
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),

              child: Text(
                '$likes likes',

                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 8),

            // USER 1 - CAPTION
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),

              child: Text(
                'flutter_student '
                'Learning Flutter one widget at a time! 🚀',

                style: TextStyle(fontSize: 15),
              ),
            ),

            const SizedBox(height: 20),

            // USER 1 - LIKE BUTTON
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),

              child: SizedBox(
                width: double.infinity,

                child: ElevatedButton.icon(
                  onPressed: toggleLike,

                  icon: Icon(isLiked ? Icons.favorite : Icons.favorite_border),

                  label: Text(isLiked ? 'Liked' : 'Like this post'),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // =====================================================
            // USER 2 - PROFILE
            // =====================================================
            Padding(
              padding: const EdgeInsets.all(16),

              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,

                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 2),
                    ),

                    child: const Icon(Icons.person, size: 30),
                  ),

                  const SizedBox(width: 12),

                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text(
                          'flutter_developer',

                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 3),

                        Text(
                          'Building Flutter apps',

                          style: TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                  ),

                  ElevatedButton(onPressed: () {}, child: const Text('Follow')),
                ],
              ),
            ),

            // =====================================================
            // USER 2 - POST
            // =====================================================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 90),
              child: Container(
                width: double.infinity,
                height: 350,

                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,

                    colors: [
                      Color(0xFF42A5F5),
                      Color(0xFF7E57C2),
                      Color(0xFFEC407A),
                      Color(0xFFFF7043),
                    ],
                  ),
                ),

                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Icon(Icons.code, size: 100, color: Colors.white),

                      SizedBox(height: 15),

                      Text(
                        'Coding',

                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 5),

                      Text(
                        'Keep learning every day',

                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // =====================================================
            // USER 2 - POST ACTIONS
            // =====================================================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),

              child: Row(
                children: [
                  IconButton(
                    onPressed: addLike2,

                    icon: const Icon(Icons.favorite_border, size: 30),
                  ),

                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.chat_bubble_outline, size: 28),
                  ),

                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.send_outlined, size: 28),
                  ),

                  const Spacer(),

                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.bookmark_border, size: 28),
                  ),
                ],
              ),
            ),

            // USER 2 - LIKE COUNT
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),

              child: Text(
                '$likes2 likes',

                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 8),

            // USER 2 - CAPTION
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),

              child: Text(
                'flutter_developer '
                'Coding something new every day! 💻',

                style: TextStyle(fontSize: 15),
              ),
            ),

            const SizedBox(height: 20),

            // USER 2 - LIKE BUTTON
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),

              child: SizedBox(
                width: double.infinity,

                child: ElevatedButton.icon(
                  onPressed: addLike2,

                  icon: const Icon(Icons.favorite_border),

                  label: const Text('Like this post'),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // =====================================================
            // USER 3 - PROFILE
            // =====================================================
            Padding(
              padding: const EdgeInsets.all(16),

              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,

                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 2),
                    ),

                    child: const Icon(Icons.person, size: 30),
                  ),

                  const SizedBox(width: 12),

                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text(
                          'tanmay_flutter',

                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 3),

                        Text(
                          'Flutter enthusiast 🚀',

                          style: TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                  ),

                  ElevatedButton(onPressed: () {}, child: const Text('Follow')),
                ],
              ),
            ),

            // =====================================================
            // USER 3 - POST
            // =====================================================
            Center(
              child: Container(
                width: 300,
                height: 350,

                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,

                    colors: [
                      Color(0xFF26A69A),
                      Color(0xFF66BB6A),
                      Color(0xFFFFCA28),
                      Color(0xFFEF5350),
                    ],
                  ),
                ),

                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Icon(Icons.phone_android, size: 100, color: Colors.white),

                      SizedBox(height: 15),

                      Text(
                        'My App',

                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 5),

                      Text(
                        'Made with Flutter ❤️',

                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // =====================================================
            // USER 3 - POST ACTIONS
            // =====================================================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),

              child: Row(
                children: [
                  IconButton(
                    onPressed: addLike3,

                    icon: const Icon(Icons.favorite_border, size: 30),
                  ),

                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.chat_bubble_outline, size: 28),
                  ),

                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.send_outlined, size: 28),
                  ),

                  const Spacer(),

                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.bookmark_border, size: 28),
                  ),
                ],
              ),
            ),

            // USER 3 - LIKE COUNT
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),

              child: Text(
                '$likes3 likes',

                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 8),

            // USER 3 - CAPTION
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),

              child: Text(
                'tanmay_flutter '
                'Making beautiful apps with Flutter! 🚀',

                style: TextStyle(fontSize: 15),
              ),
            ),

            const SizedBox(height: 20),

            // USER 3 - LIKE BUTTON
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),

              child: SizedBox(
                width: double.infinity,

                child: ElevatedButton.icon(
                  onPressed: addLike3,

                  icon: const Icon(Icons.favorite_border),

                  label: const Text('Like this post'),
                ),
              ),
            ),

            const SizedBox(height: 30),
            // =====================================================
            // USER 4 - PROFILE
            // =====================================================
            Padding(
              padding: const EdgeInsets.all(16),

              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,

                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 2),
                    ),

                    child: const Icon(Icons.person, size: 30),
                  ),

                  const SizedBox(width: 12),

                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text(
                          'Mahesh',

                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 3),

                        Text(
                          'Flutter Developer',

                          style: TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                  ),

                  ElevatedButton(onPressed: () {}, child: const Text('Follow')),
                ],
              ),
            ),

            // =====================================================
            // USER 4 - POST
            // =====================================================
            Center(
              child: Container(
                width: 300,
                height: 350,

                child: Image.asset(
                  'lib/image.png',
                  width: 300,
                  height: 350,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // =====================================================
            // USER 4 - POST ACTIONS
            // =====================================================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),

              child: Row(
                children: [
                  IconButton(
                    onPressed: addLike4,

                    icon: const Icon(Icons.favorite_border, size: 30),
                  ),

                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.chat_bubble_outline, size: 28),
                  ),

                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.send_outlined, size: 28),
                  ),

                  const Spacer(),

                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.bookmark_border, size: 28),
                  ),
                ],
              ),
            ),

            // USER 4 - LIKE COUNT
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),

              child: Text(
                '$likes4 likes',

                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 8),

            // USER 4 - CAPTION
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),

              child: Text(
                'Mahesh '
                'Working on something new! 🚀',

                style: TextStyle(fontSize: 15),
              ),
            ),

            const SizedBox(height: 20),

            // USER 4 - LIKE BUTTON
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),

              child: SizedBox(
                width: double.infinity,

                child: ElevatedButton.icon(
                  onPressed: addLike4,

                  icon: const Icon(Icons.favorite_border),

                  label: const Text('Like this post'),
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
