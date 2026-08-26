class UserProfile {
  // 1. late Keyword
  late String bio;

  void initBio() {
    bio = "Developer from NYC";
  }
}

// 2. Never Type
Never throwFatalError(String msg) {
  throw Exception("Fatal Error: $msg");
}

void main() {
  // 3. Non-Nullable vs Nullable Types (?)
  int nonNullable = 10;
  int? nullableVal = null;

  print(nonNullable);
  print(nullableVal);

  // 4. If-Null Operator (??) & Null-Aware Assignment (??=)
  int result = nullableVal ?? 0;

  print(result);

  nullableVal ??= 5;

  print(nullableVal);

  // 5. Null-Aware Access (?.) & Bang Operator (!)
  String? text;

  print(text?.length);

  text = "Dart";

  print(text!.length);

  // 6. Type Promotion
  Object data = "Smart Cast";

  if (data is String) {
    print(data.toUpperCase());
  }
}
