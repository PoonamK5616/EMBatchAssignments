class Student {
  String name = '';
  int score = 0;
  void display() => print('$name scored $score');
}

void main() {
  print('Modulus (17 % 4): ${17 % 4}');
  print('Integer division (17 ~/ 4): ${17 ~/ 4}');

  print('10 >= 10: ${10 >= 10}');

  dynamic val = "Dart Language";
  
  if (val is String) {
    print("val is indeed a String!");
  }
  
  String castedVal = val as String;
  print('String length: ${castedVal.length}');

  bool hasTicket = true;
  bool hasId = false;
  
  String status = (hasTicket && hasId) ? "Allowed" : "Denied";
  print('Status: $status');

  Student()
    ..name = 'John'
    ..score = 95
    ..display();

  Student? nullableStudent;
  nullableStudent
    ?..name = 'Jane'
    ..score = 100
    ..display();
}
