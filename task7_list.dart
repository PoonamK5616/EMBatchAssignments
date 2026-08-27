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
  List<Book> library = [
    Book("Harry Potter", "J.K. Rowling"),
    Book("The Alchemist", "Paulo Coelho"),
    Book("Atomic Habits", "James Clear"),
  ];

  library.add(
    Book("The Hobbit", "J.R.R. Tolkien"),
  );

  for (Book book in library) {
    book.displayBook();
    print("----------------");
  }
}