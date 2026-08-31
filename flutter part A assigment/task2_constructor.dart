// Task 2: Constructors
class Book {
  String title;
  String author;
  int pages;
  Book(this.title, this.author, this.pages);
  void display() {
    print('Title: $title | Author: $author | Pages: $pages');
  }
}
void main() {
  print('=== Task 2: Constructors ===');
  Book book1 = Book('Harry Potter', 'J.K. Rowling', 300);
  Book book2 = Book('Clean Code', 'Robert Martin', 450);
  book1.display();
  book2.display();
}
