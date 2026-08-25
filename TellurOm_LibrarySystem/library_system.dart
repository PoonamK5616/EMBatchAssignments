class Item {
  String title;
  bool isCheckedOut;

  Item(this.title, {this.isCheckedOut = false});

  void displayInfo() {
    print('Title: $title | Status: ${isCheckedOut ? "Checked Out" : "Available"}');
  }
}

class Book extends Item {
  String author;

  Book(String title, this.author) : super(title);

  @override
  void displayInfo() {
    print('Book: $title by $author | Status: ${isCheckedOut ? "Checked Out" : "Available"}');
  }
}

class Library {
  List<Item> items = [];

  void addItem(Item item) {
    items.add(item);
    print('Added "${item.title}" to the library.');
  }

  void displayAllItems() {
    print('\n--- Library Inventory ---');
    // Loop requirement
    for (var item in items) {
      item.displayInfo();
    }
    print('-------------------------');
  }

  void checkOutItem(String title) {
    for (var item in items) {
      if (item.title.toLowerCase() == title.toLowerCase()) {
        if (!item.isCheckedOut) {
          item.isCheckedOut = true;
          print('Successfully checked out "$title".');
        } else {
          print('Sorry, "$title" is already checked out.');
        }
        return;
      }
    }
    print('Item "$title" not found in the library.');
  }
  
  void returnItem(String title) {
    for (var item in items) {
      if (item.title.toLowerCase() == title.toLowerCase()) {
        if (item.isCheckedOut) {
          item.isCheckedOut = false;
          print('Successfully returned "$title".');
        } else {
          print('"$title" was not checked out.');
        }
        return;
      }
    }
    print('Item "$title" not found in the library.');
  }
}

void main() {
  // Variables
  Library myLibrary = Library();

  // Adding items to the library
  myLibrary.addItem(Book('The Great Gatsby', 'F. Scott Fitzgerald'));
  myLibrary.addItem(Book('1984', 'George Orwell'));
  myLibrary.addItem(Book('To Kill a Mockingbird', 'Harper Lee'));

  // Display all items
  myLibrary.displayAllItems();

  // Checkout a book
  print('\n[Action: Checking out 1984]');
  myLibrary.checkOutItem('1984');
  
  myLibrary.displayAllItems();

  // Return a book
  print('\n[Action: Returning 1984]');
  myLibrary.returnItem('1984');
  
  myLibrary.displayAllItems();
}
