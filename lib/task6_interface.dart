// ignore_for_file: avoid_print

abstract class Borrowable {
  void borrowBook();
  void returnBook();
}

abstract class Searchable {
  bool searchByTitle(String query);
}

class LibraryBook implements Borrowable, Searchable {
  String title;
  String author;
  bool isBorrowed = false;

  LibraryBook(this.title, this.author);

  @override
  void borrowBook() {
    if (!isBorrowed) {
      isBorrowed = true;
      print('"$title" has been borrowed.');
    } else {
      print('"$title" is already borrowed.');
    }
  }

  @override
  void returnBook() {
    if (isBorrowed) {
      isBorrowed = false;
      print('"$title" has been returned.');
    } else {
      print('"$title" was not borrowed.');
    }
  }

  @override
  bool searchByTitle(String query) {
    return title.toLowerCase().contains(query.toLowerCase());
  }

  void displayInfo() {
    print("Title : $title");
    print("Author : $author");
    print("Status : ${isBorrowed ? 'Borrowed' : 'Available'}");
  }
}

void task6() {
  LibraryBook book = LibraryBook(
    "Harry Potter and the Chamber of Secrets",
    "J.K. Rowling",
  );

  book.displayInfo();

  print("=======================");

  book.borrowBook();
  book.displayInfo();

  print("=======================");

  book.returnBook();
  book.displayInfo();
}

void main() {
  task6();
}
