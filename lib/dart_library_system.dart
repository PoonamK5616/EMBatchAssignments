// Dart Library System - Assignment
// Using Variables, Loops, Functions, and OOP (Class with Inheritance)

import 'dart:io';

// Base class for library items
abstract class LibraryItem {
  String title;
  String author;
  String isbn;
  bool isAvailable;

  LibraryItem(this.title, this.author, this.isbn, this.isAvailable);

  // Abstract method to be implemented by subclasses
  void displayInfo();

  // Common method for checking availability
  bool checkAvailability() => isAvailable;

  // Common method to borrow item
  void borrowItem() {
    if (isAvailable) {
      isAvailable = false;
      print('✓ $title borrowed successfully!');
    } else {
      print('✗ $title is currently not available.');
    }
  }

  // Common method to return item
  void returnItem() {
    isAvailable = true;
    print('✓ $title returned successfully!');
  }
}

// Book class inheriting from LibraryItem
class Book extends LibraryItem {
  int totalPages;
  String genre;

  Book(String title, String author, String isbn, bool isAvailable,
      this.totalPages, this.genre)
      : super(title, author, isbn, isAvailable);

  @override
  void displayInfo() {
    print(
        '\n📚 Book: $title\n   Author: $author\n   ISBN: $isbn\n   Pages: $totalPages\n   Genre: $genre\n   Available: ${isAvailable ? "Yes" : "No"}');
  }
}

// Magazine class inheriting from LibraryItem
class Magazine extends LibraryItem {
  int issueNumber;
  String publicationMonth;

  Magazine(String title, String author, String isbn, bool isAvailable,
      this.issueNumber, this.publicationMonth)
      : super(title, author, isbn, isAvailable);

  @override
  void displayInfo() {
    print(
        '\n📰 Magazine: $title\n   Author: $author\n   ISBN: $isbn\n   Issue: $issueNumber\n   Month: $publicationMonth\n   Available: ${isAvailable ? "Yes" : "No"}');
  }
}

// Member class to represent library members
class Member {
  String name;
  String memberId;
  List<LibraryItem> borrowedItems;

  Member(this.name, this.memberId) : borrowedItems = [];

  // Method to display member info
  void displayMemberInfo() {
    print('\n👤 Member: $name (ID: $memberId)');
    print('   Borrowed Items: ${borrowedItems.length}');
    if (borrowedItems.isNotEmpty) {
      for (var item in borrowedItems) {
        print('      - ${item.title}');
      }
    } else {
      print('      - No items borrowed');
    }
  }

  // Method to borrow an item
  void borrowItem(LibraryItem item) {
    if (item.checkAvailability()) {
      item.borrowItem();
      borrowedItems.add(item);
    }
  }

  // Method to return an item
  void returnItem(LibraryItem item) {
    if (borrowedItems.contains(item)) {
      item.returnItem();
      borrowedItems.remove(item);
    } else {
      print('✗ $name does not have ${item.title}');
    }
  }
}

// Library class to manage all library operations
class Library {
  String libraryName;
  List<LibraryItem> inventory;
  List<Member> members;

  Library(this.libraryName)
      : inventory = [],
        members = [];

  // Add item to inventory
  void addItem(LibraryItem item) {
    inventory.add(item);
    print('✓ Added "${item.title}" to inventory.');
  }

  // Add member to library
  void addMember(Member member) {
    members.add(member);
    print('✓ Registered member: ${member.name} (${member.memberId})');
  }

  // Display all items in inventory
  void displayInventory() {
    print('\n' + '=' * 50);
    print('📚 $libraryName - Complete Inventory');
    print('=' * 50);

    if (inventory.isEmpty) {
      print('No items in inventory.');
      return;
    }

    // Loop through all items and display info
    for (int i = 0; i < inventory.length; i++) {
      inventory[i].displayInfo();
    }
  }

  // Display available items
  void displayAvailableItems() {
    print('\n' + '=' * 50);
    print('🟢 $libraryName - Available Items');
    print('=' * 50);

    List<LibraryItem> availableItems = [];

    // Loop to filter available items
    for (var item in inventory) {
      if (item.checkAvailability()) {
        availableItems.add(item);
      }
    }

    if (availableItems.isEmpty) {
      print('No items available at the moment.');
      return;
    }

    // Display all available items
    for (int i = 0; i < availableItems.length; i++) {
      print('\n${i + 1}. ${availableItems[i].title} by ${availableItems[i].author}');
    }
  }

  // Display all members
  void displayMembers() {
    print('\n' + '=' * 50);
    print('👥 $libraryName - Registered Members');
    print('=' * 50);

    if (members.isEmpty) {
      print('No members registered yet.');
      return;
    }

    // Loop through all members and display info
    for (var member in members) {
      member.displayMemberInfo();
    }
  }

  // Search for item by title
  LibraryItem? searchItemByTitle(String title) {
    for (var item in inventory) {
      if (item.title.toLowerCase() == title.toLowerCase()) {
        return item;
      }
    }
    return null;
  }

  // Search for member by ID
  Member? searchMemberById(String memberId) {
    for (var member in members) {
      if (member.memberId == memberId) {
        return member;
      }
    }
    return null;
  }

  // Get library statistics
  void displayStatistics() {
    print('\n' + '=' * 50);
    print('📊 $libraryName - Statistics');
    print('=' * 50);

    int totalItems = inventory.length;
    int availableCount = 0;
    int borrowedCount = 0;

    // Loop to count available and borrowed items
    for (var item in inventory) {
      if (item.isAvailable) {
        availableCount++;
      } else {
        borrowedCount++;
      }
    }

    print('Total Items: $totalItems');
    print('Available: $availableCount');
    print('Borrowed: $borrowedCount');
    print('Total Members: ${members.length}');

    // Calculate borrow statistics
    if (members.isNotEmpty) {
      int totalBorrowed = 0;
      for (var member in members) {
        totalBorrowed += member.borrowedItems.length;
      }
      print('Total Items Borrowed by Members: $totalBorrowed');
    }
  }
}

// Main function - Library operations demonstration
void main() {
  // Create library instance
  Library myLibrary = Library('City Central Library');

  print('\n🏛️  Welcome to ${myLibrary.libraryName}\n');

  // Add books to inventory
  Book book1 = Book('Dart Programming', 'Gaurav Kulkarni', 'ISBN-001', true, 450, 'Technology');
  Book book2 = Book('Advanced Dart', 'John Doe', 'ISBN-002', true, 520, 'Technology');
  Book book3 = Book('Flutter Development', 'Jane Smith', 'ISBN-003', true, 380, 'Technology');

  // Add magazines to inventory
  Magazine magazine1 = Magazine('Tech Today', 'Editorial Team', 'ISSN-001', true, 5, 'August 2026');
  Magazine magazine2 = Magazine('Innovation Weekly', 'Editorial Team', 'ISSN-002', true, 34, 'August 2026');

  // Add items to library
  myLibrary.addItem(book1);
  myLibrary.addItem(book2);
  myLibrary.addItem(book3);
  myLibrary.addItem(magazine1);
  myLibrary.addItem(magazine2);

  // Register members
  Member member1 = Member('Gaurav Kulkarni', 'M001');
  Member member2 = Member('Poonam K', 'M002');
  Member member3 = Member('John Developer', 'M003');

  myLibrary.addMember(member1);
  myLibrary.addMember(member2);
  myLibrary.addMember(member3);

  // Display initial inventory
  myLibrary.displayInventory();
  myLibrary.displayAvailableItems();

  // Perform borrowing operations
  print('\n' + '=' * 50);
  print('📖 Borrowing Operations');
  print('=' * 50);

  member1.borrowItem(book1);
  member1.borrowItem(magazine1);
  member2.borrowItem(book2);
  member3.borrowItem(book3);

  // Display members with their borrowed items
  myLibrary.displayMembers();

  // Display available items after borrowing
  myLibrary.displayAvailableItems();

  // Return an item
  print('\n' + '=' * 50);
  print('📕 Return Operations');
  print('=' * 50);

  member1.returnItem(book1);

  // Display statistics
  myLibrary.displayStatistics();

  // Display final state
  print('\n' + '=' * 50);
  print('Final Library State');
  print('=' * 50);
  myLibrary.displayMembers();
  myLibrary.displayAvailableItems();

  print('\n✓ Library System Demo Complete!\n');
}
