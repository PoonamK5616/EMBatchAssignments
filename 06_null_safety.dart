// 1. late Keyword

class UserProfile {
  late String bio;

  void initBio() {
    bio = "Developer from NYC";
  }
}


// 2. Never Type

Never throwFatalError(String msg) {
  throw Exception("Fatal Error: $msg");
}


void createProfile({
  required String name,
  required int age,
}) {
  print("Name: $name");
  print("Age: $age");
}


void main() {
  // 3. Non-Nullable vs Nullable Types

  int nonNullable = 10;

  int? nullableVal = null;

  print(nonNullable);
  print(nullableVal);


  // 4. If-Null Operator (??)

  int result = nullableVal ?? 0;

  print("Result: $result");


  // 5. Null-Aware Assignment (??=)

  nullableVal ??= 5;

  print("Nullable value: $nullableVal");


  // 6. Null-Aware Access (?.)

  String? text;

  // ignore: dead_code
  print(text?.length);


  // 7. Bang Operator (!)

  text = "Dart";

  // ignore: unnecessary_non_null_assertion
  print(text!.length);


  // 8. Type Promotion

  Object data = "Smart Cast";

  if (data is String) {
    print(data.toUpperCase());
  }


  // 9. late Keyword

  UserProfile user = UserProfile();

  user.initBio();

  print(user.bio);


  // 10. required Modifier

  createProfile(
    name: "Parth",
    age: 21,
  );


  // 11. Never Type
  //
  // Uncomment only if you want to intentionally
  // throw an exception.
  //
  // throwFatalError("Something went wrong");
}