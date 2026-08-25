class Book {
  String title;
  String author;

  Book(this.title, this.author);

  void displayBook() {
    print("Book Title: $title");
    print("Author: $author");
    print("-------------------");
  }
}

void task2() {
  Book book1 = Book("Harry Potter", "J.K. Rowling");
  Book book2 = Book("The Alchemist", "Paulo Coelho");
  Book book3 = Book("Atomic Habits", "James Clear");

  book1.displayBook();
  book2.displayBook();
  book3.displayBook();
}

void main() {
  task2();
}