import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Instagram',
          style: TextStyle(
            color: Colors.black,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.send, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      
      // Centers the feed and limits width for Web browsers
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: ListView(
            children: [
              // Post 1
              InstagramPost(
                username: 'Abdullah',
                profileColor: Colors.green.shade400,
                imageUrl: 'https://images.unsplash.com/photo-1472214103451-9374bd1c798e?auto=format&fit=crop&w=800&q=80',
                initialLikes: 342,
                caption: 'A beautiful morning hike.',
              ),
              
              // Post 2
              InstagramPost(
                username: 'Kirthish',
                profileColor: Colors.blue.shade400,
                imageUrl: 'https://images.unsplash.com/photo-1449824913935-59a10b8d2000?auto=format&fit=crop&w=800&q=80',
                initialLikes: 890,
                caption: 'The city lights never get old.',
              ),
              
              // Post 3
              InstagramPost(
                username: 'Mahesh',
                profileColor: Colors.brown.shade400,
                imageUrl: 'https://images.unsplash.com/photo-1497935586351-b67a49e012bf?auto=format&fit=crop&w=800&q=80',
                initialLikes: 156,
                caption: 'Starting the day right. ☕',
              ),

              // Post 4
              InstagramPost(
                username: 'Sudarshan',
                profileColor: Colors.teal.shade500,
                imageUrl: 'https://images.unsplash.com/photo-1555066931-4365d14bab8c?auto=format&fit=crop&w=800&q=80',
                initialLikes: 204,
                caption: 'Late night coding session. 💻',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom StatefulWidget for individual posts
class InstagramPost extends StatefulWidget {
  final String username;
  final Color profileColor;
  final String imageUrl;
  final int initialLikes;
  final String caption;

  const InstagramPost({
    super.key,
    required this.username,
    required this.profileColor,
    required this.imageUrl,
    required this.initialLikes,
    required this.caption,
  });

  @override
  State<InstagramPost> createState() => _InstagramPostState();
}

class _InstagramPostState extends State<InstagramPost> {
  late int likesCount;
  bool isLiked = false;
  bool isFollowing = false;

  @override
  void initState() {
    super.initState();
    likesCount = widget.initialLikes;
  }

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
      if (isLiked) {
        likesCount++;
      } else {
        likesCount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 1. Profile Section
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: widget.profileColor,
              ),
              const SizedBox(width: 10),
              Text(
                widget.username,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  setState(() {
                    isFollowing = !isFollowing;
                  });
                },
                child: Text(
                  isFollowing ? 'Following' : 'Follow',
                  style: TextStyle(
                    color: isFollowing ? Colors.grey : Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Icon(Icons.more_vert),
            ],
          ),
        ),

        // 2. Real Image Area (With Black Background for Letterbox effect)
        GestureDetector(
          onDoubleTap: toggleLike,
          child: AspectRatio(
            aspectRatio: 1.0, 
            child: Container(
              color: Colors.black, // Adds the black bars around the image
              child: Image.network(
                widget.imageUrl,
                fit: BoxFit.contain, // Ensures the entire image stays visible
                width: double.infinity,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(child: CircularProgressIndicator());
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Icon(Icons.broken_image, size: 50, color: Colors.grey),
                  );
                },
              ),
            ),
          ),
        ),

        // 3. Action Icons
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
          child: Row(
            children: [
              IconButton(
                icon: Icon(
                  isLiked ? Icons.favorite : Icons.favorite_border,
                  color: isLiked ? Colors.red : Colors.black,
                  size: 28,
                ),
                onPressed: toggleLike,
              ),
              const IconButton(
                icon: Icon(Icons.chat_bubble_outline, size: 26),
                onPressed: null,
              ),
              const IconButton(
                icon: Icon(Icons.send_outlined, size: 26),
                onPressed: null,
              ),
              const Spacer(),
              const IconButton(
                icon: Icon(Icons.bookmark_border, size: 28),
                onPressed: null,
              ),
            ],
          ),
        ),

        // 4. Like Count
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Text(
            '$likesCount likes',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ),

        // 5. Caption
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 6.0),
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
        
        const SizedBox(height: 15), 
      ],
    );
  }
}