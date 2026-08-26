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

void task7() {
  List<Book> bookList = [
    Book("Harry Potter and the Chamber of Secrets", "J.K. Rowling", "Fantasy"),
    Book("The Great Gatsby", "F. Scott Fitzgerald", "Novel"),
    Book("The Hobbit", "J.R.R. Tolkien", "Fantasy"),
  ];

  print("--- All Books in List ---");
  for (var book in bookList) {
    book.displayBook();
  }

  print("=======================");

  // Adding a new book to list
  bookList.add(Book("1984", "George Orwell", "Dystopian"));

  print("--- Fantasy Books Only ---");
  List<Book> fantasyBooks = bookList
      .where((b) => b.genre == "Fantasy")
      .toList();
  for (var book in fantasyBooks) {
    book.displayBook();
  }
}

void main() {
  task7();
}
