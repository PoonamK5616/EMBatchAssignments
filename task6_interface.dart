abstract class LibraryItem {
  void displayItem();
}

class PrintedBook implements LibraryItem {
  String title;
  String author;

  PrintedBook(this.title, this.author);

  @override
  void displayItem() {
    print("Book Type: Printed Book");
    print("Book Title: $title");
    print("Author: $author");
  }
}

void main() {
  LibraryItem book = PrintedBook(
    "1984",
    "George Orwell",
  );

  book.displayItem();
}