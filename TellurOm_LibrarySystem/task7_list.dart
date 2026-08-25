import 'task4_inheritance.dart';

class ListDemonstration {
  void runDemonstration() {
    print('\n--- Task 7: List Demonstration ---');
    List<Book> bookList = [
      Book('B001', '1984', 1949, 'George Orwell'),
      Book('B002', 'To Kill a Mockingbird', 1960, 'Harper Lee'),
      Book('B003', 'The Great Gatsby', 1925, 'F. Scott Fitzgerald'),
    ];

    print('Iterating over a List of books:');
    for (var book in bookList) {
      print('- ${book.title} by ${book.author}');
    }
    
    // Add item
    bookList.add(Book('B004', 'Moby Dick', 1851, 'Herman Melville'));
    print('Total books in list after adding: ${bookList.length}');
  }
}
