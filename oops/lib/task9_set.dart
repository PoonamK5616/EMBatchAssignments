class Book {
    String bookName;
    String author;

    Book(this.bookName, this.author);

    @override
    bool operator ==(Object other) =>
        identical(this, other) ||
        other is Book &&
            runtimeType == other.runtimeType &&
            bookName == other.bookName &&
            author == other.author;

    @override
    int get hashCode => bookName.hashCode ^ author.hashCode;
}

void task() {
    Set<Book> bookSet = {
        Book("The Hobbit", "J.R.R. Tolkien"),
        Book("1984", "George Orwell"),
        Book("The Hobbit", "J.R.R. Tolkien"), // Duplicate, will be ignored by Set
    };

    for (var book in bookSet) {
        print("${book.bookName} by ${book.author}");
    }
}