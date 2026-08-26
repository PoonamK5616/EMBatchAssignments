class Student {
  String name = '';
  int score = 0;
  void display() => print('$name scored $score');
}

void main() {
  // 1. Arithmetic & Relational Operators
  // TODO: Calculate modulus (17 % 4) and integer division (17 ~/ 4).
  int modulusResult = 17 % 4;
  int intDivisionResult = 17 ~/ 4;
  print('Modulus (17 % 4): $modulusResult');
  print('Integer division (17 ~/ 4): $intDivisionResult');

  // TODO: Compare if (10 >= 10) and print result.
  bool comparisonResult = 10 >= 10;
  print('Is 10 >= 10? $comparisonResult');

  // 2. Type Test (is, is!) & Type Cast (as)
  dynamic val = "Dart Language";
  // TODO: Write an if statement using 'is String' to check type.
  if (val is String) {
    print('val is indeed a String');
  }

  if (val is! int) {
    print('val is not an int');
  }

  // TODO: Cast 'val as String' and print string length.
  String strVal = val as String;
  print('Cast val as String length: ${strVal.length}');

  // 3. Logical & Ternary Operators
  bool hasTicket = true;
  bool hasId = false;
  // TODO: Check if (hasTicket && hasId). Use ternary operator to assign status = hasTicket ? "Allowed" : "Denied".
  bool canAccess = hasTicket && hasId;
  print('hasTicket && hasId: $canAccess');
  String status = hasTicket ? "Allowed" : "Denied";
  print('Status: $status');

  // 4. Cascade (..) & Null-Aware Cascade (?..)
  // TODO: Instantiate 'Student' using cascade notation to set name='John', score=95, and call display() in one line.
  Student()..name = 'John'..score = 95..display();

  Student? nullableStudent;
  // TODO: Use null-aware cascade (?..) on nullableStudent to safely call display().
  nullableStudent?..name = 'Jane'..score = 90..display();
  print('Null-aware cascade completed safely on nullableStudent (was null, so display was skipped).');
}
