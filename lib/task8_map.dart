// ignore_for_file: avoid_print

class Book {
  String title;
  String author;
  String genre;

  Book(this.title, this.author, this.genre);

  void displayBook() {
    print("Title : $title | Author : $author | Genre : $genre");
  }
}

void task8() {
  Map<String, Book> bookCatalog = {
    "ISBN-001": Book("Harry Potter", "J.K. Rowling", "Fantasy"),
    "ISBN-002": Book("The Great Gatsby", "F. Scott Fitzgerald", "Novel"),
  };

  print("--- Book Catalog (Map) ---");
  bookCatalog.forEach((isbn, book) {
    print("[$isbn]");
    book.displayBook();
  });

  print("=======================");

  // Add new entry
  bookCatalog["ISBN-003"] = Book("1984", "George Orwell", "Dystopian");

  // Fetch specific book
  String searchIsbn = "ISBN-001";
  print("Searching for $searchIsbn:");
  if (bookCatalog.containsKey(searchIsbn)) {
    bookCatalog[searchIsbn]!.displayBook();
  }
}

void main() {
  task8();
}
