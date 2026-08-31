// Task 4: Inheritance
class Item {
  String title;
  int year;
  Item(this.title, this.year);
  void display() {
    print('Title: $title, Year: $year');
  }
}
class Book extends Item {
  String author;
  Book(String title, int year, this.author) : super(title, year);
  @override
  void display() {
    print('Book: $title | Author: $author | Year: $year');
  }
}
void main() {
  print('=== Task 4: Inheritance ===');
  Book book = Book('Flutter Guide', 2024, 'Alex');
  book.display();
}
