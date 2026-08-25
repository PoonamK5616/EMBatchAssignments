abstract class Book {
  void displayBook();
}

class PrintedBook implements Book {
  String title;
  String author;

  PrintedBook(this.title, this.author);

  @override
  void displayBook() {
    print("Book Type: Printed Book");
    print("Book Title: $title");
    print("Author: $author");
  }
}

class DigitalBook implements Book {
  String title;
  String author;

  DigitalBook(this.title, this.author);

  @override
  void displayBook() {
    print("Book Type: Digital Book");
    print("Book Title: $title");
    print("Author: $author");
  }
}

void task6() {
  Book printedBook = PrintedBook(
    "1984",
    "George Orwell",
  );

  Book digitalBook = DigitalBook(
    "The Great Gatsby",
    "F. Scott Fitzgerald",
  );

  printedBook.displayBook();

  print("-------------------");

  digitalBook.displayBook();
}

void main() {
  task6();
}