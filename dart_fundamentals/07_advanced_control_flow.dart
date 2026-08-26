// ignore_for_file: avoid_print, file_names

// Sealed class hierarchy for pattern matching test
sealed class Shape {}

class Square extends Shape {
  final double side;
  Square(this.side);
}

class Circle extends Shape {
  final double radius;
  Circle(this.radius);
}

class Rectangle extends Shape {
  final double w, h;
  Rectangle(this.w, this.h);
}

void main() {
  // 1. Advanced Switch Statements & Switch Expressions with Guard Clauses (when)
  Object response = (statusCode: 200, data: {"user": "Alice"});

  // TODO: Write a switch expression evaluating 'response' using record matching:
  // - If statusCode is 200 and data contains "user", return "Success: <user>"
  // - If statusCode is 404, return "Not Found"
  // - Use a guard clause ('when') to match any 5xx error code (statusCode >= 500 && statusCode < 600)
  // - Default case (_) returns "Unknown Error"
  String responseResult = switch (response) {
    (statusCode: 200, data: {'user': String user}) => 'Success: $user',
    (statusCode: 404, data: _) => 'Not Found',
    (statusCode: int code, data: _) when code >= 500 && code < 600 =>
      'Server Error: $code',
    _ => 'Unknown Error',
  };
  print('Switch Expression Result: $responseResult');

  // 2. Sealed Classes & Exhaustiveness Checking with Switch
  Shape currentShape = Circle(5.0);

  // TODO: Use a switch expression to return the area of currentShape.
  // Note: Notice how sealed classes enforce compile-time exhaustive checks without requiring a wild-card '_' case.
  double area = switch (currentShape) {
    Square(:final side) => side * side,
    Circle(:final radius) => 3.14159 * radius * radius,
    Rectangle(:final w, :final h) => w * h,
  };
  print('Calculated Area: $area');

  // 3. Destructuring in for-in Loops
  var entries = [
    (id: 1, info: ['Admin', 'Active']),
    (id: 2, info: ['User', 'Pending']),
  ];

  // TODO: Iterate through 'entries' using a for-in loop with pattern destructuring.
  // Extract 'id' and the first element of 'info' directly inside the loop declaration:
  // e.g., for (var (id: id, info: [role, ...]) in entries) { ... }
  for (var (id: id, info: [role, ...]) in entries) {
    print('Entry ID: $id, Role: $role');
  }

  // 4. Labeled Loop Control (break & continue across outer/inner loops)
  // TODO: Write a nested loop (outer: 1..3, inner: 1..3).
  // Tag the outer loop with a label (e.g., 'outerLoop:').
  // When outer * inner == 4, use 'break outerLoop;' to completely exit both loops.
  outerLoop:
  for (int outer = 1; outer <= 3; outer++) {
    for (int inner = 1; inner <= 3; inner++) {
      print('outer: $outer, inner: $inner, product: ${outer * inner}');
      if (outer * inner == 4) {
        print('Breaking outerLoop at product 4');
        break outerLoop;
      }
    }
  }

  // 5. Advanced assert Statements
  int userAge = 15;
  // TODO: Write an assert statement checking userAge >= 18.
  // Include a dynamic error message constructed using string interpolation:
  // assert(userAge >= 18, "Access denied: User is $userAge years old, minimum required is 18.");
  try {
    assert(
      userAge >= 18,
      "Access denied: User is $userAge years old, minimum required is 18.",
    );
  } catch (e) {
    print('Caught Assert Error: $e');
  }
}
