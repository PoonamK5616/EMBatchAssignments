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

  EBook(super.title, super.author, this.fileSize);

  void displayFileSize() {
    print("File Size: $fileSize MB");
  }
}

void main() {
  EBook book = EBook(
    "Clean Code",
    "Robert C. Martin",
    5.2,
  );

  book.displayBook();
  book.displayFileSize();
}