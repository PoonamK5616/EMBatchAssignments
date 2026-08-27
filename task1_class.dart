class Book {
  String title = "";
  String author = "";

  void displayBook() {
    print("Book Title: $title");
    print("Author: $author");
  }
}

void main() {
  Book book = Book();

  book.title = "Harry Potter";
  book.author = "J.K. Rowling";

  book.displayBook();
}