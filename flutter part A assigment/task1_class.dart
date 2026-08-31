// Task 1: Class and Object Basics
class Book {
  String title = 'Dart Programming';
  String author = 'John Smith';
  int pages = 250;
  bool isAvailable = true;
}
void main() {
  print('=== Task 1: Class and Object ===');
  Book myBook = Book();
  print('Title: ${myBook.title}');
  print('Author: ${myBook.author}');
  print('Pages: ${myBook.pages}');
  print('Available: ${myBook.isAvailable}');
}
