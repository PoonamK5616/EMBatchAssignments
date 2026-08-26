class Book {
    String bookName;
    String author;

    Book(this.bookName, this.author);
}

void task() {
    List<Book> bookList = [
        Book("The Hobbit", "J.R.R. Tolkien"),
        Book("1984", "George Orwell"),
    ];

    for (var book in bookList) {
        print("${book.bookName} by ${book.author}");
    }
}