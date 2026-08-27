class Book {
  String title;
  String author;

  Book(this.title, this.author);

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

void main() {
  Book book = Book(
    "Atomic Habits",
    "James Clear",
  );

  book.displayBook();
  book.openBook();
  book.closeBook();
}