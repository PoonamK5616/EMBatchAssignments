// ignore_for_file: avoid_print, unnecessary_this

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

  void updateTitle(String newTitle) {
    this.title = newTitle;
    print("Title updated to: $newTitle");
  }

  void updateAuthor(String newAuthor) {
    this.author = newAuthor;
    print("Author updated to: $newAuthor");
  }

  void updateGenre(String newGenre) {
    this.genre = newGenre;
    print("Genre updated to: $newGenre");
  }
}

void task3() {
  Book book = Book("Title", "Author", "Genre");
  book.displayBook();

  print("=======================");

  book.updateTitle("Harry Potter");
  book.updateAuthor("J.K. Rowling");
  book.updateGenre("Fantasy");

  print("=======================");

  book.displayBook();
}

void main() {
  task3();
}
