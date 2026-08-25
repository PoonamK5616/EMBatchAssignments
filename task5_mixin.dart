mixin BookLogger {
  void logBookAction(String action) {
    print("Book Action: $action");
  }
}

class Book with BookLogger {
  String title;
  String author;

  Book(this.title, this.author);

  void displayBook() {
    print("Book Title: $title");
    print("Author: $author");
  }
}

void task5() {
  Book book = Book(
    "The Kite Runner",
    "Khaled Hosseini",
  );

  book.displayBook();
  book.logBookAction("Book borrowed");
}

void main() {
  task5();
}