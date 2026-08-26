class Book {
    String bookName;
    String author;

    Book(this.bookName, this.author);
}

class EBook extends Book {
    double fileSize;

    EBook(String bookName, String author, this.fileSize) : super(bookName, author);
}