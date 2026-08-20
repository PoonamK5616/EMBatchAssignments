import 'package:flutter/material.dart';
import 'contact_page.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // =====================================================
  // LIKES
  // =====================================================

  int likes1 = 124;
  bool isLiked1 = false;

  int likes2 = 87;
  bool isLiked2 = false;

  int likes3 = 156;
  bool isLiked3 = false;

  // =====================================================
  // LIKE FUNCTIONS
  // =====================================================

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

  void toggleLike2() {
    setState(() {
      if (isLiked2) {
        likes2--;
        isLiked2 = false;
      } else {
        likes2++;
        isLiked2 = true;
      }
    });
  }

  void toggleLike3() {
    setState(() {
      if (isLiked3) {
        likes3--;
        isLiked3 = false;
      } else {
        likes3++;
        isLiked3 = true;
      }
    });
  }

  // =====================================================
  // Keep the complete image visible in a slightly wider tile.
  // =====================================================

  Widget squareImage(String imagePath) {
  return Container(
    width: double.infinity,
    color: const Color(0xFFF2F2F2), // Grey background across full width
    padding: const EdgeInsets.symmetric(vertical: 20),
    child: Center(
      child: SizedBox(
        width: 400,
        child: AspectRatio(
          aspectRatio: 1.15,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return const ColoredBox(
                  color: Color(0xFFF2F2F2),
                  child: Center(
                    child: Icon(
                      Icons.image,
                      size: 70,
                      color: Colors.grey,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(

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

          IconButton(
            tooltip: 'Contact',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ContactPage(),
                ),
              );
            },
            icon: const Icon(
              Icons.phone_outlined,
              color: Colors.black,
            ),
          ),
        ],
      ),

      // =================================================
      // BODY
      // =================================================

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // =================================================
            // POST 1
            // =================================================

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
                        color: Colors.black,
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
                          'sakksayy',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 3),

                        Text(
                          'Dreaming',
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),

                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Follow'),
                  ),
                ],
              ),
            ),

            // =================================================
            // POST 1 - 4 x 4 SQUARE
            // =================================================

            squareImage(
              'assets/images/post1.png',
            ),

            // =================================================
            // POST 1 ACTIONS
            // =================================================

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
                'sakksayy Cool Uncle 😎🤘',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),

            const SizedBox(height: 20),

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

            // =================================================
            // POST 2
            // =================================================

            const Divider(
              thickness: 8,
              color: Color(0xFFF5F5F5),
            ),

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
                        color: Colors.black,
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
                          'sakksayy',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 3),

                        Text(
                          'bas yu hi',
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),

                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Follow'),
                  ),
                ],
              ),
            ),

            // =================================================
            // POST 2 - 4 x 4 SQUARE
            // =================================================

            squareImage(
              'assets/images/post2.png',
            ),

            // =================================================
            // POST 2 ACTIONS
            // =================================================

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
                'sakksayy Phool Wali Ladki 🌸',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),

            const SizedBox(height: 20),

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

            // =================================================
            // POST 3
            // =================================================

            const Divider(
              thickness: 8,
              color: Color(0xFFF5F5F5),
            ),

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
                        color: Colors.black,
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
                          'sakksayy',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 3),

                        Text(
                          'aaram',
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),

                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Follow'),
                  ),
                ],
              ),
            ),

            // =================================================
            // POST 3 - 4 x 4 SQUARE
            // =================================================

            squareImage(
              'assets/images/post3.png',
            ),

            // =================================================
            // POST 3 ACTIONS
            // =================================================

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
               'sakksayy Ek Cup Chai ☕',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: toggleLike3,
                  icon: Icon(
                    isLiked3
                        ? Icons.favorite
                        : Icons.favorite_border,
                  ),
                  label: Text(
                    isLiked3
                        ? 'Liked'
                        : 'Like this post',
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),

            // =================================================
            // STUDENT INFORMATION
            // =================================================

            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [

                  Text(
                    'Student Information',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    'Name: Sakshi Pokhriyal',
                  ),

                  Text(
                    'Roll No.: Your Roll Number',
                  ),

                  Text(
                    'Batch: Your Batch',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}