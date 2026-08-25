class Book {
  String title;
  String author;
  bool isAvailable;

  Book(this.title, this.author, {this.isAvailable = true});

  void displayBook() {
    print('Book Title: $title');
    print('Author: $author');
    print('Available: $isAvailable');
  }

  void borrowBook() {
    if (isAvailable) {
      isAvailable = false;
      print('$title has been borrowed.');
    } else {
      print('$title is not available.');
    }
  }

  void returnBook() {
    isAvailable = true;
    print('$title has been returned.');
  }
}

class EBook extends Book {
  double fileSize;

  EBook(String title, String author, this.fileSize)
      : super(title, author);

  @override
  void displayBook() {
    print('E-Book Title: $title');
    print('Author: $author');
    print('File Size: $fileSize MB');
    print('Available: $isAvailable');
  }
}

class Library {
  String name;
  List<Book> books;

  Library(this.name, this.books);

  void displayBooks() {
    print('\n$name');
    print('Available Books:');

    for (var book in books) {
      print('- ${book.title} by ${book.author}');
    }
  }

  Book? findBook(String title) {
    for (var book in books) {
      if (book.title == title) {
        return book;
      }
    }
    return null;
  }

  void borrowBook(String title) {
    Book? book = findBook(title);

    if (book != null) {
      book.borrowBook();
    } else {
      print('Book not found.');
    }
  }

  void returnBook(String title) {
    Book? book = findBook(title);

    if (book != null) {
      book.returnBook();
    } else {
      print('Book not found.');
    }
  }
}

void showLibraryDetails(Library library) {
  print('\nLibrary Details');
  print('Library Name: ${library.name}');
  print('Total Books: ${library.books.length}');
}

void main() {
  Book book1 = Book('The Alchemist', 'Paulo Coelho');
  Book book2 = Book('1984', 'George Orwell');
  Book book3 = Book('To Kill a Mockingbird', 'Harper Lee');

  EBook book4 = EBook('Dart Programming', 'John Smith', 5.6);

  Library library = Library(
    'City Library',
    [book1, book2, book3, book4],
  );

  showLibraryDetails(library);

  library.displayBooks();

  print('\nBook Details:');
  for (var book in library.books) {
    book.displayBook();
    print('');
  }

  print('Borrowing Books:');
  library.borrowBook('1984');
  library.borrowBook('The Alchemist');

  print('\nTrying to borrow 1984 again:');
  library.borrowBook('1984');

  print('\nReturning Book:');
  library.returnBook('1984');

  print('\nSearching for a Book:');
  Book? foundBook = library.findBook('Dart Programming');

  if (foundBook != null) {
    print('Book found: ${foundBook.title}');
  } else {
    print('Book not found.');
  }
}