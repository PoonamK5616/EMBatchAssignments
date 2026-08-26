void main() {
  // 1. List
  // TODO: Create a growable List<int> of numbers [10, 20, 30]. Add 40, remove 10, print second item.
  List<int> numbers = [10, 20, 30];
  numbers.add(40);
  numbers.remove(10); // List becomes [20, 30, 40]
  print('Second item in list: ${numbers[1]}');

  // 2. Set
  // TODO: Create a Set<String> with duplicated entries (e.g., {"apple", "banana", "apple"}). 
  // Print the Set to verify uniqueness.
  Set<String> fruits = {"apple", "banana", "apple"};
  print('Unique items in Set: $fruits');

  // 3. Map
  // TODO: Create a Map<String, dynamic> student = {'name': 'Alex', 'grade': 'A'}. Add key 'age': 20.
  Map<String, dynamic> student = {'name': 'Alex', 'grade': 'A'};
  student['age'] = 20;
  print('Student map: $student');

  // 4. Type Conversion
  // TODO: Convert String "123" to int using int.parse().
  int parsedValue = int.parse("123");
  print('Parsed int value: $parsedValue (type: ${parsedValue.runtimeType})');

  // TODO: Convert double 45.67 to String with 1 decimal place using toStringAsFixed(1).
  double rawDouble = 45.67;
  String formattedDoubleStr = rawDouble.toStringAsFixed(1);
  print('Formatted double string: "$formattedDoubleStr"');
}
