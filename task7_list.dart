class Book {
  String title;
  String author;

  Book(this.title, this.author);

  void displayBook() {
    print("Book Title: $title");
    print("Author: $author");
  }
}

void task7() {
  List<Book> library = [
    Book("Harry Potter", "J.K. Rowling"),
    Book("The Alchemist", "Paulo Coelho"),
    Book("Atomic Habits", "James Clear"),
    Book("The Hobbit", "J.R.R. Tolkien"),
    Book("Clean Code", "Robert C. Martin"),
  ];

  library.add(
    Book("The Kite Runner", "Khaled Hosseini"),
  );

  print("Library Books:");

  for (Book book in library) {
    book.displayBook();
    print("-------------------");
  }
}

void main() {
  task7();
}