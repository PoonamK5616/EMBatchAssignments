class Book {
  String title;
  String author;

  Book(this.title, this.author);

  void displayBook() {
    print("Book Title: $title");
    print("Author: $author");
  }
}

mixin BookLogger {
  void logBookAction(String action) {
    print("Book Action: $action");
  }
}

class LibraryBook extends Book with BookLogger {
  LibraryBook(super.title, super.author);
}

void main() {
  LibraryBook book = LibraryBook(
    "The Kite Runner",
    "Khaled Hosseini",
  );

  book.displayBook();
  book.logBookAction("Book borrowed");
}