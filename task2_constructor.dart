class Book {
  String title;
  String author;

  Book(this.title, this.author);

  void displayBook() {
    print("Book Title: $title");
    print("Author: $author");
  }
}

void main() {
  Book book = Book(
    "The Alchemist",
    "Paulo Coelho",
  );

  book.displayBook();
}