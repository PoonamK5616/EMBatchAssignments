// Task 10: Simple Library System
class Book {
  String id;
  String title;
  String author;
  bool isBorrowed;
  Book(this.id, this.title, this.author, {this.isBorrowed = false});
  void display() {
    String status = isBorrowed ? 'Borrowed' : 'Available';
    print('[$id] "$title" by $author -> Status: $status');
  }
}
class Library {
  String name;
  List<Book> books = [];
  Library(this.name);
  void addBook(Book book) {
    books.add(book);
    print('Added: "${book.title}" to $name');
  }
  void borrowBook(String bookId) {
    for (var book in books) {
      if (book.id == bookId) {
        if (!book.isBorrowed) {
          book.isBorrowed = true;
          print('Successfully borrowed "${book.title}"');
        } else {
          print('Sorry, "${book.title}" is already borrowed.');
        }
        return;
      }
    }
    print('Book with ID $bookId not found.');
  }
  void returnBook(String bookId) {
    for (var book in books) {
      if (book.id == bookId) {
        book.isBorrowed = false;
        print('Successfully returned "${book.title}"');
        return;
      }
    }
    print('Book with ID $bookId not found.');
  }
  void showAllBooks() {
    print('\n--- All Books in $name ---');
    for (int i = 0; i < books.length; i++) {
      books[i].display();
    }
    print('--------------------------\n');
  }
}
void main() {
  print('=== Task 10: Library System ===\n');
  Library myLibrary = Library('City Central Library');
  myLibrary.addBook(Book('B1', 'Clean Code', 'Robert Martin'));
  myLibrary.addBook(Book('B2', 'Atomic Habits', 'James Clear'));
  myLibrary.addBook(Book('B3', 'Dart Basics', 'John Doe'));
  myLibrary.showAllBooks();
  print('Borrowing B1:');
  myLibrary.borrowBook('B1');
  print('\nTrying to borrow B1 again:');
  myLibrary.borrowBook('B1');
  myLibrary.showAllBooks();
  print('Returning B1:');
  myLibrary.returnBook('B1');
  myLibrary.showAllBooks();
}
