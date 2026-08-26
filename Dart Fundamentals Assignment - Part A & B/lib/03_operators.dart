class Student {
  String name = '';
  int score = 0;

  void display() => print('$name scored $score');
}

void main() {
  // 1. Arithmetic & Relational Operators
  int modulus = 17 % 4;
  int integerDivision = 17 ~/ 4;

  print(modulus);
  print(integerDivision);

  bool comparison = 10 >= 10;

  print(comparison);

  // 2. Type Test (is, is!) & Type Cast (as)
  dynamic val = "Dart Language";

  if (val is String) {
    print('val is String');
  }

  if (val is! int) {
    print('val is not int');
  }

  String text = val as String;

  print(text.length);

  // 3. Logical & Ternary Operators
  bool hasTicket = true;
  bool hasId = false;

  print(hasTicket && hasId);

  String status = hasTicket ? "Allowed" : "Denied";

  print(status);

  // 4. Cascade (..) & Null-Aware Cascade (?..)
  Student student = Student()
    ..name = 'John'
    ..score = 95
    ..display();

  Student? nullableStudent;

  nullableStudent
    ?..name = 'John'
    ..score = 95
    ..display();

  print(student.name);
}
