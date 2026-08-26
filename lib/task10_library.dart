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

class BookLibrary {
  String libraryName;
  final List<Book> _books = [];

  BookLibrary(this.libraryName);

  void addBook(Book book) {
    _books.add(book);
    print('Added "${book.title}" to $libraryName.');
  }

  void removeBook(String title) {
    _books.removeWhere((b) => b.title.toLowerCase() == title.toLowerCase());
    print('Removed "$title" from $libraryName.');
  }

  void displayLibrary() {
    print("=== $libraryName Book Collection ===");
    if (_books.isEmpty) {
      print("No books available in the library.");
    } else {
      for (var i = 0; i < _books.length; i++) {
        print("${i + 1}. ");
        _books[i].displayBook();
      }
    }
  }
}

void task10() {
  BookLibrary library = BookLibrary("City Central Library");

  library.addBook(Book("Harry Potter", "J.K. Rowling", "Fantasy"));
  library.addBook(Book("The Great Gatsby", "F. Scott Fitzgerald", "Novel"));
  library.addBook(Book("The Hobbit", "J.R.R. Tolkien", "Fantasy"));

  print("=======================");
  library.displayLibrary();

  print("=======================");
  library.removeBook("The Great Gatsby");

  print("=======================");
  library.displayLibrary();
}

void main() {
  task10();
}
