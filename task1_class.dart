class Book {
  String title = '';
  String author = '';

  void displayBook() {
    print('Book Title: $title');
    print('Author: $author');
    print('-------------------');
  }
}

void task1() {
  Book book1 = Book();
  book1.title = 'Harry Potter';
  book1.author = 'J.K. Rowling';

  Book book2 = Book();
  book2.title = 'The Alchemist';
  book2.author = 'Paulo Coelho';

  Book book3 = Book();
  book3.title = 'Atomic Habits';
  book3.author = 'James Clear';

  Book book4 = Book();
  book4.title = 'Rich Dad Poor Dad';
  book4.author = 'Robert Kiyosaki';

  Book book5 = Book();
  book5.title = 'The Hobbit';
  book5.author = 'J.R.R. Tolkien';

  Book book6 = Book();
  book6.title = '1984';
  book6.author = 'George Orwell';

  Book book7 = Book();
  book7.title = 'The Great Gatsby';
  book7.author = 'F. Scott Fitzgerald';

  Book book8 = Book();
  book8.title = 'To Kill a Mockingbird';
  book8.author = 'Harper Lee';

  Book book9 = Book();
  book9.title = 'The Kite Runner';
  book9.author = 'Khaled Hosseini';

  Book book10 = Book();
  book10.title = 'The Power of Now';
  book10.author = 'Eckhart Tolle';

  List<Book> library = [
    book1,
    book2,
    book3,
    book4,
    book5,
    book6,
    book7,
    book8,
    book9,
    book10,
  ];

  for (Book book in library) {
    book.displayBook();
  }
}

void main() {
  task1();
}