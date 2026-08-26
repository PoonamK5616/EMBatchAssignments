// ignore_for_file: avoid_print

class Book {
  String title;
  String author;
  String genre;

  Book(this.title, this.author, this.genre);

  void displayBook() {
    print("Title : $title");
    print("Author : $author");
    print("Genre : $genre");
  }
}

void task2() {
  Book book1 = Book(
    "Harry Potter and the Chamber of Secrets",
    "J.K. Rowling",
    "Fantasy",
  );

  Book book2 = Book("The Great Gatsby", "F. Scott Fitzgerald", "Novel");

  book1.displayBook();

  print("=======================");

  book2.displayBook();
}

void main() {
  task2();
}
