class UserProfile {
  late String bio;

  void initBio() {
    bio = "Developer from NYC";
  }
}

Never throwFatalError(String msg) {
  throw Exception("Fatal Error: $msg");
}

void main() {
  int nonNullable = 10;
  int? nullableVal = null;

  int result = nullableVal ?? 0;
  nullableVal ??= 5;

  String? text;
  print(text?.length);
  
  text = "Dart";
  print(text!.length);

  Object data = "Smart Cast";
  if (data is String) {
    print(data.toUpperCase());
  }
}
