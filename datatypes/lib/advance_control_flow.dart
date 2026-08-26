sealed class Shape {}
class Square extends Shape { final double side; Square(this.side); }
class Circle extends Shape { final double radius; Circle(this.radius); }
class Rectangle extends Shape { final double w, h; Rectangle(this.w, this.h); }

void main() {
  // 1. Switch Expressions with Guard Clauses
  Object response = (statusCode: 200, data: {"user": "Alice"});
  String responseResult = switch (response) {
    (statusCode: 200, data: Map m) when m.containsKey('user') => 'Success: ${m['user']}',
    (statusCode: 404, data: _) => 'Not Found',
    (statusCode: int code, data: _) when code >= 500 && code < 600 => 'Server Error ($code)',
    _ => 'Unknown Error',
  };
  print('Response result: $responseResult');

  // 2. Sealed Classes & Exhaustiveness Checking
  Shape currentShape = Circle(5.0);
  double area = switch (currentShape) {
    Square(:final side) => side * side,
    Circle(:final radius) => 3.14159 * radius * radius,
    Rectangle(:final w, :final h) => w * h,
  };
  print('Calculated Area: $area');

  // 3. Destructuring in for-in Loops
  var entries = [(id: 1, info: ['Admin', 'Active']), (id: 2, info: ['User', 'Pending'])];
  for (var (id: id, info: [role, ...]) in entries) print('ID: $id, Role: $role');

  // 4. Labeled Loop Control
  outerLoop:
  for (int outer = 1; outer <= 3; outer++) {
    for (int inner = 1; inner <= 3; inner++) {
      if (outer * inner == 4) break outerLoop;
      print('outer=$outer, inner=$inner');
    }
  }
}