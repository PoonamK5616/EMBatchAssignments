import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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
            // PROFILE 1 - Bruno Fernandes
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
                        color: Colors.redAccent,
                        width: 2,
                      ),
                    ),

                    child: ClipOval(
                      child: Image.asset(
                        'lib/depositphotos_839537430-stock-photo-bruno-fernandes-manchester-united-prepares.webp',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),

                  const Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: [

                        Text(
                          'bruno_fernandes',

                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 3),

                        Text(
                          'Manchester United • Midfielder',

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
            // POST 1
            // ======================================

            SizedBox(
              width: double.infinity,
              height: 350,

              child: Image.asset(
                'lib/depositphotos_839537430-stock-photo-bruno-fernandes-manchester-united-prepares.webp',
                fit: BoxFit.cover,
              ),
            ),

            // REUSABLE POST WIDGET 1

            const PostWidget(
              username: 'bruno_fernandes',
              caption:
                  'Pre-match focus! ⚽🔴 Ready for the big clash tonight! #MUFC',
            ),

            // ======================================
            // PROFILE 2 - Marcus Rashford
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
                        color: Colors.redAccent,
                        width: 2,
                      ),
                    ),

                    child: ClipOval(
                      child: Image.asset(
                        'lib/GettyImages-1236544135.webp',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),

                  const Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: [

                        Text(
                          'marcus_rashford',

                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 3),

                        Text(
                          'Manchester United • Forward',

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
            // POST 2
            // ======================================

            SizedBox(
              width: double.infinity,
              height: 350,

              child: Image.asset(
                'lib/GettyImages-1236544135.webp',
                fit: BoxFit.cover,
              ),
            ),

            // REUSABLE POST WIDGET 2

            const PostWidget(
              username: 'marcus_rashford',
              caption:
                  'Matchday energy! ⚡⚽ Great performance with the squad today! #Rashford #MUFC',
            ),

            // ======================================
            // PROFILE 3 - Kobbie Mainoo
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
                        color: Colors.redAccent,
                        width: 2,
                      ),
                    ),

                    child: ClipOval(
                      child: Image.asset(
                        'lib/GettyImages-2266006656.webp',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),

                  const Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: [

                        Text(
                          'kobbie_mainoo',

                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 3),

                        Text(
                          'Manchester United • Midfielder',

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
            // POST 3
            // ======================================

            SizedBox(
              width: double.infinity,
              height: 350,

              child: Image.asset(
                'lib/GettyImages-2266006656.webp',
                fit: BoxFit.cover,
              ),
            ),

            // REUSABLE POST WIDGET 3

            const PostWidget(
              username: 'kobbie_mainoo',
              caption:
                  'Living the dream on the pitch every single day! 🔴🔥 #Mainoo #RedDevils',
            ),

            // ======================================
            // PROFILE 4 - Alejandro Garnacho
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
                        color: Colors.redAccent,
                        width: 2,
                      ),
                    ),

                    child: ClipOval(
                      child: Image.asset(
                        'lib/9Urp4nCRYvWQiYAr9nFHsJ.webp',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),

                  const Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: [

                        Text(
                          'alejandro_garnacho',

                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 3),

                        Text(
                          'Manchester United • Winger',

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
            // POST 4
            // ======================================

            SizedBox(
              width: double.infinity,
              height: 350,

              child: Image.asset(
                'lib/9Urp4nCRYvWQiYAr9nFHsJ.webp',
                fit: BoxFit.cover,
              ),
            ),

            // REUSABLE POST WIDGET 4

            const PostWidget(
              username: 'alejandro_garnacho',
              caption:
                  'Samba magic on the wing! 🪄⚽ Always push for victory! #Garnacho #MUFC',
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}


// ==================================================
// REUSABLE POST WIDGET
// ==================================================

class PostWidget extends StatefulWidget {

  final String username;
  final String caption;

  const PostWidget({
    super.key,
    required this.username,
    required this.caption,
  });

  @override
  State<PostWidget> createState() => _PostWidgetState();
}


class _PostWidgetState extends State<PostWidget> {

  int likes = 0;
  bool isLiked = false;


  // ================================================
  // LIKE FUNCTION
  // ================================================

  void toggleLike() {

    setState(() {

      likes++;
      isLiked = true;

    });
  }


  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [

        // ==========================================
        // POST ACTIONS
        // ==========================================

        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 8,
          ),

          child: Row(
            children: [

              // LIKE

              IconButton(
                onPressed: toggleLike,

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


        // ==========================================
        // LIKE COUNT
        // ==========================================

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


        // ==========================================
        // CAPTION
        // ==========================================

        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),

          child: Text(

            '${widget.username} ${widget.caption}',

            style: const TextStyle(
              fontSize: 15,
            ),
          ),
        ),


        const SizedBox(height: 20),


        // ==========================================
        // LIKE BUTTON
        // ==========================================

        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),

          child: SizedBox(
            width: double.infinity,

            child: ElevatedButton.icon(

              onPressed: toggleLike,

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
    );
  }
}