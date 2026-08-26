// Core Library System Logic in Dart

// ==========================================
// 1. ABSTRACT BASE CLASS (OOP Concept)
// ==========================================
abstract class LibraryItem {
  // Variables
  String id;
  String title;
  String author;
  bool isBorrowed;

  LibraryItem(this.id, this.title, this.author, {this.isBorrowed = false});

  // Borrow Function
  void borrowItem() {
    if (isBorrowed) {
      print('❌ "$title" is already borrowed.');
    } else {
      isBorrowed = true;
      print('✅ Borrowed "$title".');
    }
  }

  // Return Function
  void returnItem() {
    if (!isBorrowed) {
      print('❌ "$title" was not borrowed.');
    } else {
      isBorrowed = false;
      print('✅ Returned "$title".');
    }
  }

  // Abstract method (Polymorphism)
  void displayInfo();
}

// ==========================================
// 2. INHERITANCE (Child Classes)
// ==========================================
class Book extends LibraryItem {
  int pageCount;
  String genre;

  Book(super.id, super.title, super.author, this.pageCount, this.genre);

  @override
  void displayInfo() {
    String status = isBorrowed ? 'Borrowed' : 'Available';
    print('[BOOK] ID: $id | Title: "$title" | Author: $author | Genre: $genre | Pages: $pageCount | Status: $status');
  }
}

class Magazine extends LibraryItem {
  int issueNumber;

  Magazine(super.id, super.title, super.author, this.issueNumber);

  @override
  void displayInfo() {
    String status = isBorrowed ? 'Borrowed' : 'Available';
    print('[MAGAZINE] ID: $id | Title: "$title" | Issue: #$issueNumber | Status: $status');
  }
}

// ==========================================
// 3. LIBRARY CLASS (Management, Functions & Loops)
// ==========================================
class Library {
  String name;
  List<LibraryItem> items = []; // List Variable

  Library(this.name);

  // Function to add item
  void addItem(LibraryItem item) {
    items.add(item);
    print('➕ Added "${item.title}" to catalog.');
  }

  // Function with LOOP (for-in loop)
  void displayAllItems() {
    print('\n--- $name Catalog ---');
    if (items.isEmpty) {
      print('Catalog is empty.');
    } else {
      for (var item in items) {
        item.displayInfo();
      }
    }
    print('-----------------------\n');
  }

  // Function with LOOP (for loop)
  void searchByTitle(String query) {
    print('Searching catalog for "$query"...');
    bool found = false;
    for (int i = 0; i < items.length; i++) {
      if (items[i].title.toLowerCase().contains(query.toLowerCase())) {
        items[i].displayInfo();
        found = true;
      }
    }
    if (!found) {
      print('No items found matching "$query".');
    }
    print('');
  }
}

// ==========================================
// 4. MAIN ENTRY POINT
// ==========================================
void main() {
  Library myLibrary = Library('City Central Library');

  // Creating items (Subclasses)
  Book book1 = Book('B01', 'The Dart Programming Language', 'Gilad Bracha', 384, 'Computer Science');
  Book book2 = Book('B02', 'Clean Code', 'Robert C. Martin', 464, 'Software Engineering');
  Magazine mag1 = Magazine('M01', 'Tech Monthly', 'Tech Media', 142);

  // Adding items
  print('=== ADDING ITEMS ===');
  myLibrary.addItem(book1);
  myLibrary.addItem(book2);
  myLibrary.addItem(mag1);

  // Display catalog (Loop)
  myLibrary.displayAllItems();

  // Borrow & Return operations (Functions)
  print('=== BORROWING & RETURNING ===');
  book1.borrowItem();
  book1.borrowItem(); // Try borrowing again

  myLibrary.displayAllItems();

  book1.returnItem();
  myLibrary.displayAllItems();

  // Search operation (Loop)
  print('=== SEARCHING ===');
  myLibrary.searchByTitle('Code');
}
