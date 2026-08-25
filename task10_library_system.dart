class Book {
  String title;
  String author;

  // Constructor
  Book(this.title, this.author);

  // Methods
  void displayBook() {
    print("Book Title: $title");
    print("Author: $author");
  }

  void openBook() {
    print("$title is now open.");
  }

  void closeBook() {
    print("$title has been closed.");
  }
}

// Inheritance
class EBook extends Book {
  double fileSize;

  EBook(String title, String author, this.fileSize)
      : super(title, author);

  void displayFileSize() {
    print("File Size: $fileSize MB");
  }
}

// Mixin
mixin BookLogger {
  void logBookAction(String action) {
    print("Book Action: $action");
  }
}

class LibraryBook extends Book with BookLogger {
  LibraryBook(String title, String author) : super(title, author);
}

// Interface
abstract class LibraryItem {
  void displayItem();
}

class PrintedBook implements LibraryItem {
  String title;
  String author;

  PrintedBook(this.title, this.author);

  @override
  void displayItem() {
    print("Book Type: Printed Book");
    print("Book Title: $title");
    print("Author: $author");
  }
}

class DigitalBook implements LibraryItem {
  String title;
  String author;

  DigitalBook(this.title, this.author);

  @override
  void displayItem() {
    print("Book Type: Digital Book");
    print("Book Title: $title");
    print("Author: $author");
  }
}

void main() {
  // --------------------------------
  // 1. CONSTRUCTOR
  // --------------------------------

  print("===== CONSTRUCTOR =====");

  Book book1 = Book(
    "Harry Potter",
    "J.K. Rowling",
  );

  Book book2 = Book(
    "The Alchemist",
    "Paulo Coelho",
  );

  book1.displayBook();
  print("-------------------");
  book2.displayBook();

  // --------------------------------
  // 2. METHODS
  // --------------------------------

  print("\n===== METHODS =====");

  Book book3 = Book(
    "Atomic Habits",
    "James Clear",
  );

  book3.displayBook();
  book3.openBook();
  book3.closeBook();

  // --------------------------------
  // 3. INHERITANCE
  // --------------------------------

  print("\n===== INHERITANCE =====");

  EBook ebook = EBook(
    "Clean Code",
    "Robert C. Martin",
    5.2,
  );

  ebook.displayBook();
  ebook.displayFileSize();

  // --------------------------------
  // 4. MIXIN
  // --------------------------------

  print("\n===== MIXIN =====");

  LibraryBook libraryBook = LibraryBook(
    "The Kite Runner",
    "Khaled Hosseini",
  );

  libraryBook.displayBook();
  libraryBook.logBookAction("Book borrowed");

  // --------------------------------
  // 5. INTERFACE
  // --------------------------------

  print("\n===== INTERFACE =====");

  LibraryItem printedBook = PrintedBook(
    "1984",
    "George Orwell",
  );

  LibraryItem digitalBook = DigitalBook(
    "The Great Gatsby",
    "F. Scott Fitzgerald",
  );

  printedBook.displayItem();

  print("-------------------");

  digitalBook.displayItem();

  // --------------------------------
  // 6. LIST
  // --------------------------------

  print("\n===== LIST =====");

  List<Book> library = [
    Book("Harry Potter", "J.K. Rowling"),
    Book("The Alchemist", "Paulo Coelho"),
    Book("Atomic Habits", "James Clear"),
    Book("The Hobbit", "J.R.R. Tolkien"),
    Book("Clean Code", "Robert C. Martin"),
  ];

  library.add(
    Book("The Kite Runner", "Khaled Hosseini"),
  );

  for (Book book in library) {
    book.displayBook();
    print("-------------------");
  }

  // --------------------------------
  // 7. MAP
  // --------------------------------

  print("\n===== MAP =====");

  Map<String, String> bookAuthors = {
    "Harry Potter": "J.K. Rowling",
    "The Alchemist": "Paulo Coelho",
    "Atomic Habits": "James Clear",
    "The Hobbit": "J.R.R. Tolkien",
  };

  bookAuthors["Clean Code"] = "Robert C. Martin";

  print(
    "Author of The Hobbit: ${bookAuthors["The Hobbit"]}",
  );

  print("\nBook and Author List:");

  bookAuthors.forEach((title, author) {
    print("Book: $title");
    print("Author: $author");
    print("-------------------");
  });

  // --------------------------------
  // 8. SET
  // --------------------------------

  print("\n===== SET =====");

  Set<String> uniqueBooks = {
    "Harry Potter",
    "The Alchemist",
    "Atomic Habits",
    "The Hobbit",
    "Clean Code",
  };

  uniqueBooks.add("The Kite Runner");

  // Duplicate value will not be added
  uniqueBooks.add("Harry Potter");

  print("Unique Books:");

  for (String book in uniqueBooks) {
    print(book);
  }

  print("\nTotal Unique Books: ${uniqueBooks.length}");
}