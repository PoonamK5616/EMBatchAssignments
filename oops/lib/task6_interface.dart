class Readable {
    void read() {}
}

class Book implements Readable {
    String bookName;
    String author;

    Book(this.bookName, this.author);

    @override
    void read() {
        print("Reading $bookName by $author");
    }
}