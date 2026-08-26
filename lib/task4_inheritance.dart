// ignore_for_file: avoid_print

class Book {
  String title;
  String author;
  String genre;

  Book(this.title, this.author, this.genre);

  void displayBook() {
    print("Title : $title");
    print("Author : $author");
    print("Genre : $genre");
  }
}

class EBook extends Book {
  double fileSizeMB;

  EBook(super.title, super.author, super.genre, this.fileSizeMB);

  @override
  void displayBook() {
    super.displayBook();
    print("File Size : ${fileSizeMB}MB");
  }
}

class PrintedBook extends Book {
  int pageCount;

  PrintedBook(super.title, super.author, super.genre, this.pageCount);

  @override
  void displayBook() {
    super.displayBook();
    print("Page Count : $pageCount");
  }
}

void task4() {
  EBook ebook = EBook(
    "Harry Potter and the Chamber of Secrets",
    "J.K. Rowling",
    "Fantasy",
    5.4,
  );

  PrintedBook printedBook = PrintedBook(
    "The Great Gatsby",
    "F. Scott Fitzgerald",
    "Novel",
    180,
  );

  print("--- EBook Details ---");
  ebook.displayBook();

  print("=======================");

  print("--- Printed Book Details ---");
  printedBook.displayBook();
}

void main() {
  task4();
}
