class Student {
  String name = '';
  int score = 0;

  void display() => print('$name scored $score');
}

void main() {
  // 1. Arithmetic & Relational Operators
  int remainder = 17 % 4;
  int integerDivision = 17 ~/ 4;

  print(remainder);
  print(integerDivision);

  bool comparison = 10 >= 10;

  print(comparison);

  // 2. Type Test (is, is!) & Type Cast (as)
  dynamic val = "Dart Language";

  if (val is String) {
    print("val is a String");
  }

  String text = val as String;

  print(text.length);

  // is!
  if (val is! int) {
    print("val is not an int");
  }

  // 3. Logical & Ternary Operators
  bool hasTicket = true;
  bool hasId = false;

  bool allowed = hasTicket && hasId;

  print(allowed);

  // ignore: dead_code
  String status = hasTicket ? "Allowed" : "Denied";

  print(status);

  // 4. Cascade (..) & Null-Aware Cascade (?..)
  Student()
    ..name = 'John'
    ..score = 95
    ..display();

  Student? nullableStudent;

  nullableStudent
    // ignore: dead_code
    ?..display();
}