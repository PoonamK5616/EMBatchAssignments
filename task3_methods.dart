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

void task3() {
  Book book1 = Book("The Hobbit", "J.R.R. Tolkien");

  book1.displayBook();
  book1.openBook();
  book1.closeBook();
}

void main() {
  task3();
}