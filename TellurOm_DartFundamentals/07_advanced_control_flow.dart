sealed class Shape {}
class Square extends Shape { final double side; Square(this.side); }
class Circle extends Shape { final double radius; Circle(this.radius); }
class Rectangle extends Shape { final double w, h; Rectangle(this.w, this.h); }

void main() {
  Object response = (statusCode: 200, data: {"user": "Alice"});

  String parsedResponse = switch (response) {
    (statusCode: 200, data: Map m) when m.containsKey('user') => 'Success: ${m["user"]}',
    (statusCode: 404, data: _) => 'Not Found',
    (statusCode: int code, data: _) when code >= 500 && code < 600 => 'Server Error',
    _ => 'Unknown Error'
  };
  print(parsedResponse);

  Shape currentShape = Circle(5.0);
  
  double area = switch (currentShape) {
    Square(:final side) => side * side,
    Circle(:final radius) => 3.14159 * radius * radius,
    Rectangle(:final w, :final h) => w * h,
  };
  print('Calculated Area: $area');

  var entries = [
    (id: 1, info: ['Admin', 'Active']),
    (id: 2, info: ['User', 'Pending']),
  ];
  
  for (var (id: id, info: [role, ...]) in entries) {
    print('ID: $id, Role: $role');
  }

  outerLoop:
  for (int outer = 1; outer <= 3; outer++) {
    for (int inner = 1; inner <= 3; inner++) {
      if (outer * inner == 4) {
        break outerLoop;
      }
      print('Outer: $outer, Inner: $inner');
    }
  }

  int userAge = 15;
}
