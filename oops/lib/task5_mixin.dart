mixin Logger {
    void log(String message) {
        print("Log: $message");
    }
}

class Book with Logger {
    String bookName;
    String author;

    Book(this.bookName, this.author);

    void display() {
        log("Displaying $bookName by $author");
    }
}