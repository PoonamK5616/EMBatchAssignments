class Student {
  String name = '';
  int score = 0;

  void display() => print('$name scored $score');
}

void main() {
  // 1. Arithmetic & Relational Operators

  int remainder = 17 % 4;
  int integerDivision = 17 ~/ 4;

  print("Remainder: $remainder");
  print("Integer Division: $integerDivision");

  bool comparison = 10 >= 10;

  print("10 >= 10: $comparison");

  // 2. Type Test (is, is!) & Type Cast (as)

  dynamic val = "Dart Language";

  if (val is String) {
    print("val is a String");
  }

  if (val is! int) {
    print("val is not an int");
  }

  String text = val as String;

  print("String length: ${text.length}");

  // 3. Logical & Ternary Operators

  bool hasTicket = true;
  bool hasId = false;

  bool allowed = hasTicket && hasId;

  print("Has ticket AND ID: $allowed");

  String status = "Allowed";

  print("Status: $status");

  // 4. Cascade Notation (..)

  Student()
    ..name = "John"
    ..score = 95
    ..display();

  // 5. Null-Aware Cascade (?..)

  Student? nullableStudent;

  // ignore: dead_code
  nullableStudent?..display();
}