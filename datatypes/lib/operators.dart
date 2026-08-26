class Student {
  String name = '';
  int score = 0;
  void display() => print('$name scored $score');
}

void main() {
  // 1. Arithmetic & Relational
  print('Modulus: ${17 % 4}, Int Div: ${17 ~/ 4}');
  print('10 >= 10: ${10 >= 10}');

  // 2. Type Test & Cast
  dynamic val = "Dart Language";
  if (val is String) print('val is indeed a String');
  print('Length of strVal: ${(val as String).length}');

  // 3. Logical & Ternary
  bool hasTicket = true;
  bool hasId = false;
  print('Status: ${hasTicket && hasId ? "Allowed" : "Denied"}');

  // 4. Cascade & Null-Aware Cascade
  Student()..name = 'John'..score = 95..display();

  Student? nullableStudent;
  nullableStudent?..name = 'Jane'..score = 90..display();
}