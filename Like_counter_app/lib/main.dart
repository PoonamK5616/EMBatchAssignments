import 'package:flutter/material.dart';

// 1. main() and runApp()
void main() {
  runApp(const MyApp());
}

// 2. MaterialApp wrapped in a basic Stateless Widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Likes Counter App',
      home: LikeCounterApp(),
    );
  }
}

// 3. StatefulWidget to hold mutable state
class LikeCounterApp extends StatefulWidget {
  const LikeCounterApp({super.key});

  @override
  State<LikeCounterApp> createState() => _LikeCounterAppState();
}

// 4. State class handling the logic and UI
class _LikeCounterAppState extends State<LikeCounterApp> {
  // State variable
  int likes = 0;

  @override
  Widget build(BuildContext context) {
    // Scaffold provides AppBar and body
    return Scaffold(
      appBar: AppBar(
        title: const Text('Social Post'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      // Padding used for spacing around the edges
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          // Proper alignment to center the content vertically
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Text widget with TextStyle
            const Text(
              'Do you like this post?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            
            // SizedBox for vertical spacing
            const SizedBox(height: 30),
            
            // Row combining Icon and Text side-by-side
            Row(
              // Proper alignment to center the items horizontally
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 40,
                ),
                
                // SizedBox for horizontal spacing
                const SizedBox(width: 10),
                
                Text(
                  '$likes Likes',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 40),
            
            // ElevatedButton to trigger state change
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                // setState updates the UI with the new data
                setState(() {
                  likes++; 
                });
              },
              child: const Row(
                mainAxisSize: MainAxisSize.min, // Keeps the row wrapped around its content
                children: [
                  Icon(Icons.thumb_up),
                  SizedBox(width: 8),
                  Text(
                    'Like Post',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}