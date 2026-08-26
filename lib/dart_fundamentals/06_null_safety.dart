class UserProfile {
  // 1. late Keyword
  late String bio; // Delayed initialization

  void initBio() {
    bio = "Developer from NYC";
  }
}

// 2. Never Type
Never throwFatalError(String msg) {
  throw Exception("Fatal Error: $msg");
}

void main() {
  print('--- 1. late Keyword ---');
  UserProfile userProfile = UserProfile();
  userProfile.initBio();
  print('UserProfile Bio: ${userProfile.bio}');

  print('--- 2. Never Type ---');
  try {
    throwFatalError("Unrecoverable database failure");
  } catch (e) {
    print('Caught expected Never function error: $e');
  }

  // 3. Non-Nullable vs Nullable Types (?)
  print('--- 3. Non-Nullable vs Nullable Types ---');
  int nonNullable = 10;
  int? nullableVal = null;
  print('nonNullable: $nonNullable, nullableVal: $nullableVal');

  // 4. If-Null Operator (??) & Null-Aware Assignment (??=)
  print('--- 4. If-Null Operator & Null-Aware Assignment ---');
  int result = nullableVal ?? 0; // Default fallback
  print('Result using ?? operator: $result');

  nullableVal ??= 5; // Assigns 5 only if null
  print('nullableVal after ??= 5: $nullableVal');

  // 5. Null-Aware Access (?.) & Bang Operator (!)
  print('--- 5. Null-Aware Access & Bang Operator ---');
  String? text;
  print('Safely access length of null String with ?.: ${text?.length}'); // Prints null safely

  // TODO: Uncomment line below after assigning text = "Dart" to test bang operator:
  text = "Dart";
  print('Access length of non-null String with bang operator (!): ${text!.length}');

  // 6. Type Promotion
  print('--- 6. Type Promotion ---');
  Object data = "Smart Cast";
  if (data is String) {
    // data is automatically promoted from Object to String here
    print('Promoted data to String (toUpperCase): ${data.toUpperCase()}');
  }
}
