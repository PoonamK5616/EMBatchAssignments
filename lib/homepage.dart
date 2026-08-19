import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // ==========================
  // POST 1 LIKE STATE
  // ==========================

  int likes1 = 0;
  bool isLiked1 = false;

  void toggleLike1() {
    setState(() {
      isLiked1 = !isLiked1;

      if (isLiked1 = true) {
        likes1++;
      }
    });
  }

  // ==========================
  // POST 2 LIKE STATE
  // ==========================

  int likes2 = 0;
  bool isLiked2 = false;

  void toggleLike2() {
    setState(() {
      isLiked2 = !isLiked2;

      if (isLiked2 = true) {
        likes2++;
      } 
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
            // POST 1 PROFILE
            // ======================================

            Padding(
              padding: const EdgeInsets.all(16),

              child: Row(
                children: [

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

                  const Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: [

                        Text(
                          'tejas1',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),


                        SizedBox(height: 3),

                        Text(
                          'Learning Flutter',
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),

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
            // POST 1 IMAGE
            // ======================================

            Container(
              width: 300,
              height: 300,

              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage(
                    'assets/images/image345.png',
                  ),
                  fit: BoxFit.cover,
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

                  IconButton(
                    onPressed: toggleLike1,

                    icon: Icon(
                      isLiked1
                          ? Icons.favorite
                          : Icons.favorite_border,

                      size: 30,

                      color: isLiked1
                          ? Colors.red
                          : Colors.black,
                    ),
                  ),

                  IconButton(
                    onPressed: () {},

                    icon: const Icon(
                      Icons.chat_bubble_outline,
                      size: 28,
                    ),
                  ),

                  IconButton(
                    onPressed: () {},

                    icon: const Icon(
                      Icons.send_outlined,
                      size: 28,
                    ),
                  ),

                  const Spacer(),

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
            // POST 1 LIKES
            // ======================================

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),

              child: Text(
                '$likes1 likes',

                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 8),

            // ======================================
            // POST 1 CAPTION
            // ======================================

            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),

              child: Text(
                'tejas1 GOAT 🐐',

                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ======================================
            // POST 1 LIKE BUTTON
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
                    isLiked1
                        ? Icons.favorite
                        : Icons.favorite_border,
                  ),

                  label: Text(
                    isLiked1
                        ? 'Liked'
                        : 'Like this post',
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // ======================================
            // POST 2 PROFILE
            // ======================================

            Padding(
              padding: const EdgeInsets.all(16),

              child: Row(
                children: [

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

                  const Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: [

                        Text(
                          'CR7',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

    
                        SizedBox(height: 3),

                        Text(
                          'Football Legend',
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),

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
            // POST 2 IMAGE
            // ======================================

            Container(
              
              width: 300,
              height: 300,

              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage(
                    'assets/images/siu.png',
                  ),
                  fit: BoxFit.cover,
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

                  IconButton(
                    onPressed: () {},

                    icon: const Icon(
                      Icons.chat_bubble_outline,
                      size: 28,
                    ),
                  ),

                  IconButton(
                    onPressed: () {},

                    icon: const Icon(
                      Icons.send_outlined,
                      size: 28,
                    ),
                  ),

                  const Spacer(),

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
            // POST 2 LIKES
            // ======================================

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),

              child: Text(
                '$likes2 likes',

                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 8),

            // ======================================
            // POST 2 CAPTION
            // ======================================

            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),

              child: Text(
                'CR7 SIUUUUUU ⚽',

                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ======================================
            // POST 2 LIKE BUTTON
            // ======================================

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),

              child: SizedBox(
                width: double.infinity,

                child: ElevatedButton.icon(

                  onPressed: toggleLike2,

                  icon: Icon(
                    isLiked2
                        ? Icons.favorite
                        : Icons.favorite_border,
                  ),

                  label: Text(
                    isLiked2
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