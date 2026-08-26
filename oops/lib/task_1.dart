class Book {
    String bookName ="";
    String author="";

    void displayBook() {
        print('Book Title: $bookName');
        print('Author: $author');
    }
}

void task() {
  List<Book> books = [
    Book()..bookName = "Harry Potter"..author = "J.K. Rowling",
    Book()..bookName = "The Hobbit"..author = "J.R.R. Tolkien",
    Book()..bookName = "1984"..author = "George Orwell",
    Book()..bookName = "The Alchemist"..author = "Paulo Coelho",
    Book()..bookName = "The Great Gatsby"..author = "F. Scott Fitzgerald",
    Book()..bookName = "Pride and Prejudice"..author = "Jane Austen",
    Book()..bookName = "To Kill a Mockingbird"..author = "Harper Lee",
    Book()..bookName = "The Kite Runner"..author = "Khaled Hosseini",
    Book()..bookName = "Atomic Habits"..author = "James Clear",
    Book()..bookName = "The Da Vinci Code"..author = "Dan Brown",
  ];

  for (Book book in books) {
    book.displayBook();
    print('');
  }
}