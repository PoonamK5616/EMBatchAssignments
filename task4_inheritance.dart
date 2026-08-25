class Book {
  String title;
  String author;

  Book(this.title, this.author);

  void displayBook() {
    print("Book Title: $title");
    print("Author: $author");
  }
}

class EBook extends Book {
  double fileSize;

  EBook(String title, String author, this.fileSize)
      : super(title, author);

  void displayFileSize() {
    print("File Size: $fileSize MB");
  }
}

void task4() {
  EBook book = EBook(
    "Clean Code",
    "Robert C. Martin",
    5.2,
  );

  book.displayBook();
  book.displayFileSize();
}

void main() {
  task4();
}