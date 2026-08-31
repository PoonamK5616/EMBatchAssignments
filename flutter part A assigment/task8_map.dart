// Task 8: Map Collection
void main() {
  print('=== Task 8: Map (Key-Value) ===');
  Map<String, String> bookAuthors = {
    'Clean Code': 'Robert Martin',
    'Atomic Habits': 'James Clear',
    'The Alchemist': 'Paulo Coelho',
  };
  bookAuthors['Flutter Basics'] = 'Google Team';
  print('All Books and Authors:');
  bookAuthors.forEach((book, author) {
    print('  $book -> by $author');
  });
  print('\nAuthor of Clean Code: ${bookAuthors["Clean Code"]}');
}
