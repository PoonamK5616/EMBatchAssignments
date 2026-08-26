void main() {
  // 1. List
  List<int> numbers = [10, 20, 30];

  numbers.add(40);
  numbers.remove(10);

  print(numbers[1]);

  // 2. Set
  Set<String> fruits = {"apple", "banana", "apple"};

  print(fruits);

  // 3. Map
  Map<String, dynamic> student = {'name': 'Alex', 'grade': 'A'};

  student['age'] = 20;

  print(student);

  // 4. Type Conversion
  String numberText = "123";
  int number = int.parse(numberText);

  print(number);

  double price = 45.67;
  String formattedPrice = price.toStringAsFixed(1);

  print(formattedPrice);
}
