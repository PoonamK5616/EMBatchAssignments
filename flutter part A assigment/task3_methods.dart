// Task 3: Methods inside Class
class Book {
  String title;
  String author;
  bool isBorrowed = false;
  Book(this.title, this.author);
  void borrowBook() {
    if (isBorrowed == false) {
      isBorrowed = true;
      print('$title has been borrowed.');
    } else {
      print('$title is already borrowed!');
    }
  }
  void returnBook() {
    isBorrowed = false;
    print('$title has been returned.');
  }
  void showInfo() {
    print('Book: $title by $author | Borrowed: $isBorrowed');
  }
}
void main() {
  print('=== Task 3: Methods ===');
  Book myBook = Book('Atomic Habits', 'James Clear');
  myBook.showInfo();
  myBook.borrowBook();
  myBook.showInfo();
  myBook.returnBook();
  myBook.showInfo();
}
