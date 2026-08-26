// ignore_for_file: avoid_print

class Book {
  String title = "";
  String author = "";
  String genre = "";

  void displayBook() {
    print("Book Title: $title");
    print("Book Author: $author");
    print("Book Genre: $genre");
  }
}

void task1() {
  Book book = Book();

  book.title = "Harry Potter and the Chamber of Secrets";
  book.author = "J. K. Rowling";
  book.genre = "Fantasy";

  book.displayBook();
}

void main() {
  task1();
}
