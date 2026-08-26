class Book {
    String bookName;
    String author;

    Book(this.bookName, this.author);
}

void task() {
    Map<String, Book> bookMap = {
        "978-0261102217": Book("The Hobbit", "J.R.R. Tolkien"),
        "978-0451524935": Book("1984", "George Orwell"),
    };

    bookMap.forEach((isbn, book) {
        print("ISBN: $isbn -> ${book.bookName} by ${book.author}");
    });
}