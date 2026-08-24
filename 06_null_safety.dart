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
  // 3. Non-Nullable vs Nullable Types

  int nonNullable = 10;

  int? nullableVal = null;

  print(nonNullable);
  print(nullableVal);

  // 4. If-Null Operator (??)

  int result = nullableVal ?? 0;

  print(result);

  // 5. Null-Aware Assignment (??=)

  nullableVal ??= 5;

  print(nullableVal);

  // 6. Null-Aware Access (?.)

  String? text;

  // ignore: dead_code
  print(text?.length);

  // 7. Bang Operator (!)

  text = "Dart";

  // ignore: unnecessary_non_null_assertion, dead_code
  print(text!.length);

  // 8. Type Promotion

  Object data = "Smart Cast";

  if (data is String) {
    // data is automatically promoted from Object to String
    print(data.toUpperCase());
  }

  // 9. late Keyword demonstration

  UserProfile user = UserProfile();

  user.initBio();

  print(user.bio);

  // 10. required Modifier

  createProfile(name: "Parth", age: 21);

  // 11. Never Type
  //
  // Do not call this unless you intentionally want
  // the program to throw an exception.
  //
  // throwFatalError("Something went wrong");
}


void createProfile({
  required String name,
  required int age,
}) {
  print("Name: $name");
  print("Age: $age");
}