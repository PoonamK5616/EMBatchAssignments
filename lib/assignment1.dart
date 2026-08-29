class Item {
  String title;
  String id;
  bool isAvailable;

  Item(this.title, this.id) : isAvailable = true;

  void displayInfo() {
    print('$title - ID: $id - Available: $isAvailable');
  }
}

class Book extends Item {
  String author;

  Book(String title, String id, this.author) : super(title, id);

  @override
  void displayInfo() {
    print('Book: $title by $author - ID: $id - Available: $isAvailable');
  }
}

class Magazine extends Item {
  int issueNumber;

  Magazine(String title, String id, this.issueNumber) : super(title, id);

  @override
  void displayInfo() {
    print('Magazine: $title Issue $issueNumber - ID: $id - Available: $isAvailable');
  }
}

class Library {
  List<Item> items = [];

  void addItem(Item item) {
    items.add(item);
  }

  void displayAllItems() {
    for (int i = 0; i < items.length; i++) {
      items[i].displayInfo();
    }
  }

  Item? findItem(String id) {
    for (Item item in items) {
      if (item.id == id) {
        return item;
      }
    }
    return null;
  }

  void borrowItem(String id) {
    Item? item = findItem(id);
    if (item != null && item.isAvailable) {
      item.isAvailable = false;
      print('${item.title} borrowed successfully');
    } else {
      print('Item not available');
    }
  }
}

void main() {
  Library library = Library();
  
  Book book1 = Book('The Dart Guide', 'B001', 'John Doe');
  Book book2 = Book('Flutter Basics', 'B002', 'Jane Smith');
  Magazine mag1 = Magazine('Tech Weekly', 'M001', 45);
  
  library.addItem(book1);
  library.addItem(book2);
  library.addItem(mag1);
  
  print('Library Items:');
  library.displayAllItems();
  
  print('\nBorrowing book B001:');
  library.borrowItem('B001');
  
  print('\nUpdated Library Items:');
  library.displayAllItems();
}