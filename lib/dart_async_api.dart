/// Dart Async/Await with Null Safety - Assignment 2
/// 
/// This program demonstrates:
/// - Future and async/await for asynchronous operations
/// - Null Safety with nullable and non-nullable types
/// - Mock API data fetching simulation
/// - Error handling with try-catch
/// - Null coalescing operator (??)
/// - Map operations for JSON-like data
/// 
/// Author: Gaurav Kulkarni
/// Roll No: 150096724096

import 'dart:async';

/// User Model with Null Safety
/// 
/// Demonstrates nullable fields (email, phone, company) which can be null
/// and non-nullable fields (id, name, createdAt) which cannot be null.
class User {
  final int id;
  final String name;
  final String? email; // Nullable email
  final String? phone; // Nullable phone
  final String? company; // Nullable company
  final DateTime createdAt;

  User({
    required this.id,
    required this.name,
    this.email,
    this.phone,
    this.company,
    required this.createdAt,
  });

  // Factory constructor for creating User from mock API response
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? 0, // Default value if null
      name: json['name'] ?? 'Unknown',
      email: json['email'], // Can be null
      phone: json['phone'],
      company: json['company'],
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toString()),
    );
  }

  // Display user information with null safety
  void displayInfo() {
    print('\n👤 User Information:');
    print('   ID: $id');
    print('   Name: $name');
    print('   Email: ${email ?? 'Not provided'}'); // Using null coalescing operator
    print('   Phone: ${phone ?? 'Not provided'}');
    print('   Company: ${company ?? 'Not provided'}');
    print('   Created: ${createdAt.year}-${createdAt.month}-${createdAt.day}');
  }
}

/// Post Model with Null Safety
/// 
/// Demonstrates nullable fields (likes, tags) that can be null.
/// Uses optional chaining with ?. operator for safe navigation.
class Post {
  final int id;
  final int userId;
  final String title;
  final String content;
  final int? likes; // Nullable likes count
  final List<String>? tags; // Nullable tags
  final DateTime publishedAt;

  Post({
    required this.id,
    required this.userId,
    required this.title,
    required this.content,
    this.likes,
    this.tags,
    required this.publishedAt,
  });

  /// Factory constructor for creating Post from mock API response JSON
  /// 
  /// Safely extracts data from JSON with null safety handling
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] ?? 0,
      userId: json['userId'] ?? 0,
      title: json['title'] ?? 'Untitled',
      content: json['content'] ?? '',
      likes: json['likes'], // Can be null
      tags: List<String>.from(json['tags'] ?? []), // Default to empty list if null
      publishedAt: DateTime.parse(json['publishedAt'] ?? DateTime.now().toString()),
    );
  }

  /// Display post information with null safety handling
  void displayInfo() {
    print('\n📝 Post Information:');
    print('   ID: $id');
    print('   User ID: $userId');
    print('   Title: $title');
    print('   Content: $content');
    print('   Likes: ${likes ?? 0}'); // Default to 0 if null
    print('   Tags: ${tags?.join(", ") ?? 'No tags'}'); // Using optional chaining
    print('   Published: ${publishedAt.year}-${publishedAt.month}-${publishedAt.day}');
  }
}

/// Mock API Service with Async/Await
/// 
/// This service simulates a REST API with:
/// - Async methods using Future and async/await
/// - Mock data storage
/// - Network delay simulation
/// - Error handling with try-catch
/// - Null safety with nullable return types
class MockApiService {
  /// Simulate network delay
  static const Duration _delay = Duration(seconds: 1);

  /// Mock user data storage
  /// Demonstrates various null scenarios in data
  static final Map<int, Map<String, dynamic>> _users = {
    1: {
      'id': 1,
      'name': 'Gaurav Kulkarni',
      'email': 'gaurav@example.com',
      'phone': '9876543210',
      'company': 'TechCorp',
      'createdAt': '2026-01-15T08:30:00Z'
    },
    2: {
      'id': 2,
      'name': 'Poonam K',
      'email': 'poonam@example.com',
      'phone': null, // Null value - demonstrating null safety
      'company': 'InnovateLabs',
      'createdAt': '2026-02-10T10:00:00Z'
    },
    3: {
      'id': 3,
      'name': 'John Developer',
      'email': null, // Null value
      'phone': '9876543211',
      'company': null, // Null value
      'createdAt': '2026-03-05T14:20:00Z'
    },
  };

  /// Mock post data storage
  /// Demonstrates null values in optional fields (likes, tags)
  static final Map<int, Map<String, dynamic>> _posts = {
    1: {
      'id': 1,
      'userId': 1,
      'title': 'Learning Dart Async Programming',
      'content': 'Exploring Future, async/await, and null safety in Dart.',
      'likes': 42,
      'tags': ['dart', 'async', 'programming'],
      'publishedAt': '2026-08-20T09:00:00Z'
    },
    2: {
      'id': 2,
      'userId': 1,
      'title': 'Null Safety Best Practices',
      'content': 'Tips and tricks for using null safety effectively in Dart.',
      'likes': null, // Null likes - demonstrating null safety
      'tags': ['dart', 'null-safety'],
      'publishedAt': '2026-08-22T11:30:00Z'
    },
    3: {
      'id': 3,
      'userId': 2,
      'title': 'API Integration in Flutter',
      'content': 'How to integrate REST APIs with Flutter applications.',
      'likes': 28,
      'tags': null, // Null tags - demonstrating null safety
      'publishedAt': '2026-08-25T15:45:00Z'
    },
    4: {
      'id': 4,
      'userId': 3,
      'title': 'Async Programming Patterns',
      'content': 'Common patterns and anti-patterns in async Dart code.',
      'likes': 35,
      'tags': ['async', 'patterns', 'dart'],
      'publishedAt': '2026-08-28T16:20:00Z'
    },
  };

  /// Fetch a single user by ID asynchronously
  /// 
  /// Returns Future<User?> - nullable User on success, null if user not found or error occurs
  /// Demonstrates:
  /// - async/await for asynchronous operations
  /// - Future with nullable return type
  /// - Error handling with try-catch
  /// - Null safety with null coalescing operator (??)
  Future<User?> fetchUser(int id) async {
    print('📡 Fetching user with ID: $id...');

    // Simulate network delay
    await Future.delayed(_delay);

    // Check if user exists - null safety check
    if (!_users.containsKey(id)) {
      print('❌ User with ID $id not found');
      return null; // Return null instead of throwing error
    }

    try {
      final userData = _users[id];
      // Using null coalescing - if userData is null, use empty map
      final user = User.fromJson(userData ?? {});
      print('✓ Successfully fetched user');
      return user;
    } catch (e) {
      print('❌ Error parsing user data: $e');
      return null; // Handle error by returning null
    }
  }

  /// Fetch all users from mock data asynchronously
  /// 
  /// Returns Future<List<User>> - list of users or empty list on error
  /// Demonstrates:
  /// - Fetching multiple records
  /// - Error handling with graceful continuation
  /// - List building from API response
  Future<List<User>> fetchAllUsers() async {
    print('📡 Fetching all users...');

    // Simulate network delay
    await Future.delayed(_delay);

    List<User> users = [];

    try {
      for (final userData in _users.values) {
        try {
          final user = User.fromJson(userData);
          users.add(user);
        } catch (e) {
          print('⚠️  Error parsing user data: $e - Skipping this user');
          // Continue to next user instead of failing completely
        }
      }
      print('✓ Successfully fetched ${users.length} users');
      return users;
    } catch (e) {
      print('❌ Error fetching users: $e');
      return []; // Return empty list on error
    }
  }

  /// Fetch posts for a specific user by user ID asynchronously
  /// 
  /// Returns Future<List<Post>?> - list of posts, empty list if none found, null on critical error
  /// Demonstrates:
  /// - Filtering and querying mock data
  /// - Handling nullable return types
  /// - Where clause for filtering collections
  Future<List<Post>?> fetchPostsByUserId(int userId) async {
    print('📡 Fetching posts for user ID: $userId...');

    // Simulate network delay
    await Future.delayed(_delay);

    try {
      // Find posts for this user
      final userPosts = _posts.values
          .where((post) => post['userId'] == userId)
          .toList();

      if (userPosts.isEmpty) {
        print('⚠️  No posts found for user $userId');
        return []; // Return empty list, not null
      }

      List<Post> posts = [];
      for (final postData in userPosts) {
        try {
          final post = Post.fromJson(postData);
          posts.add(post);
        } catch (e) {
          print('⚠️  Error parsing post data: $e');
        }
      }

      print('✓ Successfully fetched ${posts.length} posts for user $userId');
      return posts;
    } catch (e) {
      print('❌ Error fetching posts: $e');
      return null; // Return null for critical errors
    }
  }

  // Fetch single post by ID - Returns Future<Post?>
  Future<Post?> fetchPost(int postId) async {
    print('📡 Fetching post with ID: $postId...');

    // Simulate network delay
    await Future.delayed(_delay);

    if (!_posts.containsKey(postId)) {
      print('❌ Post with ID $postId not found');
      return null;
    }

    try {
      final postData = _posts[postId];
      final post = Post.fromJson(postData ?? {});
      print('✓ Successfully fetched post');
      return post;
    } catch (e) {
      print('❌ Error parsing post data: $e');
      return null;
    }
  }

  // Fetch user with their posts - Chain Future operations
  // Using null safety throughout
  Future<Map<String, dynamic>?> fetchUserWithPosts(int userId) async {
    print('\n📡 Fetching user and their posts...');

    try {
      // First, fetch the user
      final user = await fetchUser(userId);

      // Check if user is null using null safety
      if (user == null) {
        print('❌ User not found');
        return null;
      }

      // Then, fetch their posts
      final posts = await fetchPostsByUserId(userId);

      // posts could be null or empty list
      return {
        'user': user,
        'posts': posts ?? [], // Use null coalescing
      };
    } catch (e) {
      print('❌ Error in fetchUserWithPosts: $e');
      return null;
    }
  }

  // Fetch all data - Parallel requests using Future.wait
  Future<Map<String, dynamic>> fetchAllData() async {
    print('\n📡 Fetching all data in parallel...');

    try {
      // Execute multiple futures in parallel
      Future<List<Post>> fetchAllPosts() async {
        List<Post> allPosts = [];
        for (int i = 1; i <= 4; i++) {
          final post = await fetchPost(i);
          if (post != null) {
            allPosts.add(post);
          }
        }
        return allPosts;
      }

      final results = await Future.wait([
        fetchAllUsers(),
        fetchAllPosts(),
      ]);

      return {
        'users': results[0] as List<User>,
        'posts': results[1] as List<Post>,
      };
    } catch (e) {
      print('❌ Error fetching all data: $e');
      return {
        'users': [],
        'posts': [],
      };
    }
  }
}

// Main function demonstrating async/await usage
Future<void> main() async {
  print('\n' + '=' * 60);
  print('🚀 Dart Async/Await with Null Safety - Mock API Demo');
  print('=' * 60);

  final apiService = MockApiService();

  // Demo 1: Fetch single user (null case)
  print('\n' + '─' * 60);
  print('Demo 1: Fetch Single User (including null case)');
  print('─' * 60);

  final user1 = await apiService.fetchUser(1);
  user1?.displayInfo(); // Using null-coalescing operator with method call

  final user4 = await apiService.fetchUser(4); // This will be null
  if (user4 != null) {
    user4.displayInfo();
  } else {
    print('❌ Could not retrieve user information');
  }

  // Demo 2: Fetch all users
  print('\n' + '─' * 60);
  print('Demo 2: Fetch All Users');
  print('─' * 60);

  final allUsers = await apiService.fetchAllUsers();
  if (allUsers.isNotEmpty) {
    for (final user in allUsers) {
      user.displayInfo();
    }
  } else {
    print('❌ No users found');
  }

  // Demo 3: Fetch posts by user (null safety with optional chaining)
  print('\n' + '─' * 60);
  print('Demo 3: Fetch Posts by User ID');
  print('─' * 60);

  final userPosts = await apiService.fetchPostsByUserId(1);
  if (userPosts != null && userPosts.isNotEmpty) {
    print('\n📚 Posts for User 1:');
    for (final post in userPosts) {
      post.displayInfo();
    }
  } else {
    print('❌ No posts found for this user');
  }

  // Demo 4: Fetch user with posts (chained futures)
  print('\n' + '─' * 60);
  print('Demo 4: Fetch User with Posts (Chained Futures)');
  print('─' * 60);

  final userWithPosts = await apiService.fetchUserWithPosts(2);
  if (userWithPosts != null) {
    final user = userWithPosts['user'] as User;
    final posts = userWithPosts['posts'] as List<Post>;

    user.displayInfo();

    if (posts.isNotEmpty) {
      print('\n📚 Posts for this user:');
      for (final post in posts) {
        post.displayInfo();
      }
    } else {
      print('\n⚠️  No posts found for this user');
    }
  }

  // Demo 5: Parallel requests using Future.wait
  print('\n' + '─' * 60);
  print('Demo 5: Parallel Requests (Future.wait)');
  print('─' * 60);

  final allData = await apiService.fetchAllData();
  final users = allData['users'] as List<User>;
  final posts = allData['posts'] as List<Post>;

  print('\n📊 Summary:');
  print('Total Users: ${users.length}');
  print('Total Posts: ${posts.length}');

  // Demo 6: Error handling with timeout
  print('\n' + '─' * 60);
  print('Demo 6: Timeout Handling');
  print('─' * 60);

  try {
    // Create a future that completes with timeout
    final userWithTimeout = await apiService
        .fetchUser(1)
        .timeout(Duration(milliseconds: 500), onTimeout: () {
      print('⏱️  Request timed out');
      return null;
    });

    if (userWithTimeout != null) {
      userWithTimeout.displayInfo();
    }
  } catch (e) {
    print('❌ Error with timeout handling: $e');
  }

  // Demo 7: Using try-catch for error handling
  print('\n' + '─' * 60);
  print('Demo 7: Try-Catch Error Handling');
  print('─' * 60);

  try {
    final post = await apiService.fetchPost(1);

    if (post != null) {
      post.displayInfo();

      // Safely access nullable properties
      final likeCount = post.likes ?? 0;
      final tagList = post.tags?.join(', ') ?? 'No tags';

      print('\n📈 Engagement:');
      print('   Likes: $likeCount');
      print('   Tags: $tagList');
    } else {
      print('❌ Post not found');
    }
  } on Exception catch (e) {
    print('❌ Exception caught: $e');
  } catch (e) {
    print('❌ Unexpected error: $e');
  }

  print('\n' + '=' * 60);
  print('✓ All demonstrations completed successfully!');
  print('=' * 60 + '\n');
}
