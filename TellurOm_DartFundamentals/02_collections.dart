void main() {
  List<int> numbers = [10, 20, 30];
  numbers.add(40);
  numbers.remove(10);
  print('Second item: ${numbers[1]}');

  Set<String> uniqueFruits = {"apple", "banana", "apple"};
  print('Set: $uniqueFruits');

  Map<String, dynamic> student = {'name': 'Alex', 'grade': 'A'};
  student['age'] = 20;
  print('Student Map: $student');

  int parsedValue = int.parse("123");
  print('Parsed int: $parsedValue');

  String formattedDouble = 45.67.toStringAsFixed(1);
  print('Formatted double: $formattedDouble');
}
