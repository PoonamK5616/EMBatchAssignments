import 'task1_class.dart';
import 'task2_constructor.dart';
import 'task3_methods.dart';
import 'task4_inheritance.dart';

class AdvancedLibrary {
  // Using List for items
  List<Book> books = [];
  
  // Using Map for members (ID to Member)
  Map<String, Member> members = {};
  
  // Using Set for genres/categories
  Set<String> categories = {};

  void addBook(Book book, String category) {
    books.add(book);
    categories.add(category);
    print('Added book: ${book.title}');
  }

  void addMember(Member member) {
    members[member.memberId] = member;
    print('Added member: ${member.name}');
  }

  void displayInventory() {
    print('\n--- Complete Library Inventory ---');
    for (var book in books) {
      book.displayInfo();
      // Using static method from task3
      if (LibraryUtils.isAntique(book.year)) {
        print(' * Note: This book is an antique!');
      }
      print('-');
    }
  }
}
