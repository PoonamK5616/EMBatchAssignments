import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Sample data for the three nature posts
  final List<Map<String, String>> posts = const [
    {
      'username': 'nature_explorer',
      'subtitle': 'Deep in the Forest',
      'imageUrl': 'https://images.unsplash.com/photo-1441974231531-c6227db76b6e?auto=format&fit=crop&w=800&q=80',
      'caption': 'Lost in the woods today! 🌲✨',
    },
    {
      'username': 'wild_wanderer',
      'subtitle': 'Mountain Peaks',
      'imageUrl': 'https://images.unsplash.com/photo-1501854140801-50d01698950b?auto=format&fit=crop&w=800&q=80',
      'caption': 'The air is so crisp up here. ⛰️',
    },
    {
      'username': 'ocean_vibes',
      'subtitle': 'Coastal Sunset',
      'imageUrl': 'https://images.unsplash.com/photo-1472214103451-9374bd1c798e?auto=format&fit=crop&w=800&q=80',
      'caption': 'Ending the day right. 🌊🌅',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Instagram',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.send_outlined, color: Colors.black),
            onPressed: () {},
          ),
          const SizedBox(width: 16), // A little padding for desktop
        ],
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(color: Colors.grey.shade300, height: 1.0),
        ),
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return NaturePost(
            username: posts[index]['username']!,
            subtitle: posts[index]['subtitle']!,
            imageUrl: posts[index]['imageUrl']!,
            caption: posts[index]['caption']!,
          );
        },
      ),
    );
  }
}

class NaturePost extends StatefulWidget {
  final String username;
  final String subtitle;
  final String imageUrl;
  final String caption;

  const NaturePost({
    super.key,
    required this.username,
    required this.subtitle,
    required this.imageUrl,
    required this.caption,
  });

  @override
  State<NaturePost> createState() => _NaturePostState();
}

class _NaturePostState extends State<NaturePost> {
  int likesCount = 0;
  bool isLiked = false;

  void _incrementLikes() {
    setState(() {
      likesCount++;
      isLiked = true; 
    });
  }

  @override
  Widget build(BuildContext context) {
    // This Center and ConstrainedBox are the key to the desktop layout
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 470, // Matches Instagram's desktop feed width
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            
            // Post Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 8.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.green,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.username,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.subtitle,
                          style: const TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.grey.shade200,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text('Follow', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),

            // Post Image (Responsive Square)
            // AspectRatio forces it to be a perfect square inside the 470px box
            ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: AspectRatio(
                aspectRatio: 0.8,
                child: Image.network(
                  widget.imageUrl,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const Center(child: CircularProgressIndicator());
                  },
                  errorBuilder: (context, error, stackTrace) => 
                      const Center(child: Icon(Icons.error)),
                ),
              ),
            ),

            // Action Icons
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: Icon(
                      isLiked ? Icons.favorite : Icons.favorite_border,
                      color: isLiked ? Colors.red : Colors.black,
                      size: 28,
                    ),
                    onPressed: _incrementLikes,
                  ),
                  const SizedBox(width: 16),
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: const Icon(Icons.chat_bubble_outline, size: 28),
                    onPressed: () {},
                  ),
                  const SizedBox(width: 16),
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: const Icon(Icons.send_outlined, size: 28),
                    onPressed: () {},
                  ),
                  const Spacer(),
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: const Icon(Icons.bookmark_border, size: 28),
                    onPressed: () {},
                  ),
                ],
              ),
            ),

            // Likes Count
            Padding(
              padding: const EdgeInsets.only(top: 4.0, bottom: 8.0),
              child: Text(
                '$likesCount likes',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),

            // Caption
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(color: Colors.black, fontSize: 14),
                  children: [
                    TextSpan(
                      text: '${widget.username} ',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: widget.caption),
                  ],
                ),
              ),
            ),

            // Big Bottom "Like this post" Button
            SizedBox(
              width: double.infinity,
              child: TextButton.icon(
                onPressed: _incrementLikes,
                style: TextButton.styleFrom(
                  backgroundColor: Colors.purple.shade50,
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                icon: Icon(
                  isLiked ? Icons.favorite : Icons.favorite_border,
                  color: Colors.purple.shade300,
                  size: 18,
                ),
                label: Text(
                  'Like this post',
                  style: TextStyle(color: Colors.purple.shade400, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Divider(thickness: 1, color: Colors.black12),
            ),
          ],
        ),
      ),
    );
  }
}