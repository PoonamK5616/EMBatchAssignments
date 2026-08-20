import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'contact_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // =====================================================
  // POST 1 - FLUTTER STUDENT
  // =====================================================

  int likes1 = 0;
  bool isLiked1 = false;
  bool isSaved1 = false;
  bool isFollowing1 = false;

  void toggleLike1() {
    setState(() {
      if (isLiked1) {
        likes1--;
        isLiked1 = false;
      } else {
        likes1++;
        isLiked1 = true;
      }
    });
  }

  // =====================================================
  // POST 2 - CHANDRESH
  // =====================================================

  int likes2 = 0;
  bool isLiked2 = false;
  bool isSaved2 = false;
  bool isFollowing2 = false;

  void toggleLike2() {
    setState(() {
      likes2++;
      isLiked2 = true;
    });
  }

  // =====================================================
  // POST 3 - AKASH
  // =====================================================

  int likes3 = 0;
  bool isLiked3 = false;
  bool isSaved3 = false;
  bool isFollowing3 = false;

  void toggleLike3() {
    setState(() {
      likes3++;
      isLiked3 = true;
    });
  }

  // =====================================================
  // POST 4 - MEET
  // =====================================================

  int likes4 = 0;
  bool isLiked4 = false;
  bool isSaved4 = false;
  bool isFollowing4 = false;

  void toggleLike4() {
    setState(() {
      likes4++;
      isLiked4 = true;
    });
  }

  // =====================================================
  // COMMENT DIALOG
  // =====================================================

  void showComment() {
    final controller = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add a comment'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(
              hintText: 'Write a comment...',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);

                ScaffoldMessenger.of(this.context).showSnackBar(
                  const SnackBar(
                    content: Text('Comment added!'),
                  ),
                );
              },
              child: const Text('Post'),
            ),
          ],
        );
      },
    );
  }

  // =====================================================
  // SHARE
  // =====================================================

  void sharePost(String username) {
    Clipboard.setData(
      ClipboardData(
        text: 'Check out $username\'s post!',
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Post copied!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // =================================================
      // APP BAR
      // =================================================

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
          // =================================================
          // NEW SERVICES PAGE BUTTON
          // =================================================
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ServicesPage(),
                ),
              );
            },
            icon: const Icon(
              Icons.miscellaneous_services_outlined,
              color: Colors.black,
            ),
          ),

          // Existing Favorite Button
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_border,
              color: Colors.black,
            ),
          ),

          // Existing Send Button
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.send_outlined,
              color: Colors.black,
            ),
          ),
        ],
      ),

      // =================================================
      // BODY
      // =================================================

      body: SingleChildScrollView(
        child: Center(
          child: FractionallySizedBox(
            widthFactor: 0.45,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // =====================================================
                // POST 1 - FLUTTER STUDENT
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
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),

                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isFollowing1 = !isFollowing1;
                          });
                        },
                        child: Text(
                          isFollowing1 ? 'Following' : 'Follow',
                        ),
                      ),
                    ],
                  ),
                ),

                // POST 1 IMAGE
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
                        Icon(
                          Icons.flutter_dash,
                          size: 100,
                          color: Colors.white,
                        ),
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
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // POST 1 BUTTONS
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
                        onPressed: showComment,
                        icon: const Icon(
                          Icons.chat_bubble_outline,
                          size: 28,
                        ),
                      ),

                      IconButton(
                        onPressed: () {
                          sharePost('flutter_student');
                        },
                        icon: const Icon(
                          Icons.send_outlined,
                          size: 28,
                        ),
                      ),

                      const Spacer(),

                      IconButton(
                        onPressed: () {
                          setState(() {
                            isSaved1 = !isSaved1;
                          });
                        },
                        icon: Icon(
                          isSaved1
                              ? Icons.bookmark
                              : Icons.bookmark_border,
                          size: 28,
                        ),
                      ),
                    ],
                  ),
                ),

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
                const SizedBox(height: 30),

                // =====================================================
                // POST 2 - CHANDRESH
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
                              'chandresh',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 3),
                            Text(
                              'Chandresh',
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),

                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isFollowing2 = !isFollowing2;
                          });
                        },
                        child: Text(
                          isFollowing2 ? 'Following' : 'Follow',
                        ),
                      ),
                    ],
                  ),
                ),

                // CHANDRESH IMAGE
                SizedBox(
                  width: double.infinity,
                  height: 350,
                  child: Image.network(
                    'https://picsum.photos/800/600?random=1',
                    fit: BoxFit.cover,
                  ),
                ),

                // BUTTONS
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
                        onPressed: showComment,
                        icon: const Icon(
                          Icons.chat_bubble_outline,
                          size: 28,
                        ),
                      ),

                      IconButton(
                        onPressed: () {
                          sharePost('chandresh');
                        },
                        icon: const Icon(
                          Icons.send_outlined,
                          size: 28,
                        ),
                      ),

                      const Spacer(),

                      IconButton(
                        onPressed: () {
                          setState(() {
                            isSaved2 = !isSaved2;
                          });
                        },
                        icon: Icon(
                          isSaved2
                              ? Icons.bookmark
                              : Icons.bookmark_border,
                          size: 28,
                        ),
                      ),
                    ],
                  ),
                ),

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

                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Text(
                    'chandresh '
                    'Having a great day! 📸✨',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                const SizedBox(height: 30),

                // =====================================================
                // POST 3 - AKASH
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
                              'akash',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 3),
                            Text(
                              'Akash',
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),

                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isFollowing3 = !isFollowing3;
                          });
                        },
                        child: Text(
                          isFollowing3 ? 'Following' : 'Follow',
                        ),
                      ),
                    ],
                  ),
                ),

                // AKASH IMAGE
                SizedBox(
                  width: double.infinity,
                  height: 350,
                  child: Image.network(
                    'https://picsum.photos/800/600?random=2',
                    fit: BoxFit.cover,
                  ),
                ),

                // BUTTONS
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  child: Row(
                    children: [
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

                      IconButton(
                        onPressed: showComment,
                        icon: const Icon(
                          Icons.chat_bubble_outline,
                          size: 28,
                        ),
                      ),

                      IconButton(
                        onPressed: () {
                          sharePost('akash');
                        },
                        icon: const Icon(
                          Icons.send_outlined,
                          size: 28,
                        ),
                      ),

                      const Spacer(),

                      IconButton(
                        onPressed: () {
                          setState(() {
                            isSaved3 = !isSaved3;
                          });
                        },
                        icon: Icon(
                          isSaved3
                              ? Icons.bookmark
                              : Icons.bookmark_border,
                          size: 28,
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Text(
                    '$likes3 likes',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 8),

                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Text(
                    'akash '
                    'Beautiful memories 🌄',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                const SizedBox(height: 30),

                // =====================================================
                // POST 4 - MEET
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
                              'meet',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 3),
                            Text(
                              'Meet',
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),

                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isFollowing4 = !isFollowing4;
                          });
                        },
                        child: Text(
                          isFollowing4 ? 'Following' : 'Follow',
                        ),
                      ),
                    ],
                  ),
                ),

                // MEET IMAGE
                SizedBox(
                  width: double.infinity,
                  height: 350,
                  child: Image.network(
                    'https://picsum.photos/800/600?random=3',
                    fit: BoxFit.cover,
                  ),
                ),

                // BUTTONS
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: toggleLike4,
                        icon: Icon(
                          isLiked4
                              ? Icons.favorite
                              : Icons.favorite_border,
                          size: 30,
                          color: isLiked4
                              ? Colors.red
                              : Colors.black,
                        ),
                      ),

                      IconButton(
                        onPressed: showComment,
                        icon: const Icon(
                          Icons.chat_bubble_outline,
                          size: 28,
                        ),
                      ),

                      IconButton(
                        onPressed: () {
                          sharePost('meet');
                        },
                        icon: const Icon(
                          Icons.send_outlined,
                          size: 28,
                        ),
                      ),

                      const Spacer(),

                      IconButton(
                        onPressed: () {
                          setState(() {
                            isSaved4 = !isSaved4;
                          });
                        },
                        icon: Icon(
                          isSaved4
                              ? Icons.bookmark
                              : Icons.bookmark_border,
                          size: 28,
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Text(
                    '$likes4 likes',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 8),

                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Text(
                    'meet '
                    'Enjoying the moment! 😎',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}