import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    
final List<Map<String, String>> posts = [
  {
    'username': 'flutter_student',
    'image': 'https://picsum.photos/id/237/600/400',
    'caption': ' blank ' ,
  },
  {
    'username': 'flutter_student',
    'image': 'https://picsum.photos/id/40/600/400',
    'caption': ' blank ',
  },
  {
    'username': 'flutter_student',
    'image': 'https://picsum.photos/id/1024/600/400',
    'caption': ' blank ',
  },
];
  // Like state - one for each post
  List<int> likes = [0, 0, 0];
  List<bool> isLiked = [false, false, false];

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
                          'flutter_student',

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
            // POST
            // ======================================

                        // ======================================
            // ALL POSTS (using a for loop)
            // ======================================

            for (int i = 0; i < posts.length; i++) ...[

              // ------ POST IMAGE ------
              Container(
                width: 300,
                height: 200,

                child: Image.network(
                  posts[i]['image']!,
                  fit: BoxFit.cover,
                  
                  // Show a loading spinner while image loads
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),

              // ------ POST ACTIONS (like, comment, share, save) ------
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),

                child: Row(
                  children: [

                    // LIKE
                    IconButton(
                      onPressed: () => toggleLike(i),

                      icon: Icon(
                        isLiked[i]
                            ? Icons.favorite
                            : Icons.favorite_border,
                        size: 30,
                        color: isLiked[i]
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

              // ------ LIKE COUNT ------
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  '${likes[i]} likes',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 8),

              // ------ CAPTION ------
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  '${posts[i]['username']} ${posts[i]['caption']}',
                  style: const TextStyle(fontSize: 15),
                ),
              ),

              // Divider between posts
              const SizedBox(height: 16),
              const Divider(height: 1),
              const SizedBox(height: 8),
            ],

            const SizedBox(height: 30),

          ],
        ),
      ),
    );
  }
}