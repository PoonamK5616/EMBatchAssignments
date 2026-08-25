import 'task2_constructor.dart';
import 'task4_inheritance.dart';
import 'task7_list.dart';
import 'task8_map.dart';
import 'task9_set.dart';
import 'task10_library_system.dart';

void main() {
  print('=== STARTING LIBRARY SYSTEM ASSIGNMENT ===\n');

  // Run isolated demonstrations for Lists, Maps, Sets
  ListDemonstration().runDemonstration();
  MapDemonstration().runDemonstration();
  SetDemonstration().runDemonstration();

  print('\n=== TASK 10: INTEGRATED LIBRARY SYSTEM ===');
  AdvancedLibrary library = AdvancedLibrary();

  // Add members
  library.addMember(Member('Alice Smith', 'M001', DateTime(2021, 5, 20)));
  library.addMember(Member.newMember('Bob Johnson', 'M002'));

  // Add books
  Book b1 = Book('B001', '1984', 1949, 'George Orwell');
  Book b2 = Book('B002', 'Pride and Prejudice', 1813, 'Jane Austen');
  Book b3 = Book('B003', 'The Catcher in the Rye', 1951, 'J.D. Salinger');
  Book b4 = Book('B004', 'Moby Dick', 1851, 'Herman Melville');

  library.addBook(b1, 'Dystopian Fiction');
  library.addBook(b2, 'Classic Romance');
  library.addBook(b3, 'Coming-of-age Fiction');
  library.addBook(b4, 'Adventure Fiction');

  // Demonstrate interface & mixin (reserve method uses mixin for logging)
  print('\n--- Interface & Mixin Usage ---');
  b1.reserve('M001');
  b1.reserve('M002'); // Should fail

  // Demonstrate inheritance and methods
  library.displayInventory();
}
