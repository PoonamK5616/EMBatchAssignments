// Task 7: List Collection & Loops
void main() {
  print('=== Task 7: List & Loops ===');
  List<String> books = [
    'Clean Code',
    'Atomic Habits',
    'Flutter Basics',
  ];
  books.add('Dart in Action');
  print('Total books: ${books.length}\n');
  print('Book List:');
  for (int i = 0; i < books.length; i++) {
    print('${i + 1}. ${books[i]}');
  }
}
