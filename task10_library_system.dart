// Name: Parth Sahani
// Roll Number: 150096724135
// Cohort: Elon Musk

class Book {
  String title;
  String author;
  bool isBorrowed;

  Book(this.title, this.author, this.isBorrowed);

  void displayBook() {
    print("Book: $title");
    print("Author: $author");
    print("Status: ${isBorrowed ? "Borrowed" : "Available"}");
  }

  void openBook() {
    print("$title is now open.");
  }

  void closeBook() {
    print("$title has been closed.");
  }

  void borrowBook() {
    if (isBorrowed) {
      print("$title is already borrowed.");
    } else {
      isBorrowed = true;
      print("$title has been borrowed.");
    }
  }

  void returnBook() {
    if (isBorrowed) {
      isBorrowed = false;
      print("$title has been returned.");
    } else {
      print("$title was not borrowed.");
    }
  }
}

// Inheritance

class EBook extends Book {
  double fileSize;

  EBook(super.title, super.author, super.isBorrowed, this.fileSize);

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
  LibraryBook(super.title, super.author, super.isBorrowed);
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
    print("Type: Printed Book");
    print("Title: $title");
    print("Author: $author");
  }
}

class DigitalBook implements LibraryItem {
  String title;
  String author;

  DigitalBook(this.title, this.author);

  @override
  void displayItem() {
    print("Type: Digital Book");
    print("Title: $title");
    print("Author: $author");
  }
}

void main() {
  print("===== MY LIBRARY SYSTEM =====");

// Constructor

  Book book1 = Book(
    "Harry Potter",
    "J.K. Rowling",
    false,
  );

  Book book2 = Book(
    "The Alchemist",
    "Paulo Coelho",
    false,
  );

  Book book3 = Book(
    "Atomic Habits",
    "James Clear",
    true,
  );

// Methods

  print("\n===== BOOK DETAILS =====");

  book1.displayBook();
  book1.openBook();
  book1.closeBook();

// Borrow Book

  print("\n===== BORROW BOOK =====");

  book1.borrowBook();
  book1.displayBook();

// Return Book

  print("\n===== RETURN BOOK =====");

  book1.returnBook();
  book1.displayBook();

// Inheritance

  print("\n===== EBOOK =====");

  EBook ebook = EBook(
    "Clean Code",
    "Robert C. Martin",
    false,
    5.2,
  );

  ebook.displayBook();
  ebook.displayFileSize();

// Mixin

  print("\n===== MIXIN =====");

  LibraryBook libraryBook = LibraryBook(
    "The Kite Runner",
    "Khaled Hosseini",
    false,
  );

  libraryBook.displayBook();
  libraryBook.logBookAction("Book borrowed");

// Interface

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
  print("----------------");
  digitalBook.displayItem();

// List

  print("\n===== LIBRARY LIST =====");

  List<Book> library = [
    book1,
    book2,
    book3,
    ebook,
    libraryBook,
  ];

  for (Book book in library) {
    book.displayBook();
    print("----------------");
  }

// Map

  print("\n===== BOOK MAP =====");

  Map<String, String> bookAuthors = {
    "Harry Potter": "J.K. Rowling",
    "The Alchemist": "Paulo Coelho",
    "Atomic Habits": "James Clear",
    "Clean Code": "Robert C. Martin",
  };

  bookAuthors["The Kite Runner"] = "Khaled Hosseini";

  bookAuthors.forEach((title, author) {
    print("Book: $title");
    print("Author: $author");
    print("----------------");
  });

// Set

  print("\n===== UNIQUE BOOKS =====");

  Set<String> uniqueBooks = {
    "Harry Potter",
    "The Alchemist",
    "Atomic Habits",
    "Clean Code",
    "The Kite Runner",
  };

  uniqueBooks.add("Harry Potter");

  for (String book in uniqueBooks) {
    print(book);
  }

  print("Total Books: ${uniqueBooks.length}");

// Final Status

  print("\n===== FINAL LIBRARY STATUS =====");

  for (Book book in library) {
    print("${book.title} : ${book.isBorrowed ? "Borrowed" : "Available"}");
  }

  print("\nLibrary system completed.");
}