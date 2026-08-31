// Task 9: Set Collection
void main() {
  print('=== Task 9: Set (Unique items) ===');
  Set<String> categories = {
    'Tech',
    'Fiction',
    'Tech',
    'History',
  };
  categories.add('Science');
  print('Categories in Library:');
  for (var category in categories) {
    print('  - $category');
  }
}
