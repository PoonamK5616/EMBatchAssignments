import 'task1_class.dart';
import 'task5_mixin.dart';
import 'task6_interface.dart';

class Book extends LibraryItem with Loggable implements Reservable {
  String author;
  String? reservedBy;
  bool isCheckedOut = false;

  Book(String id, String title, int year, this.author) : super(id, title, year);

  @override
  void displayInfo() {
    super.displayInfo();
    print('Author: $author');
    print('Status: ${isCheckedOut ? "Checked Out" : "Available"}');
    if (reservedBy != null) print('Reserved by: $reservedBy');
  }

  @override
  void reserve(String memberId) {
    if (reservedBy == null && !isCheckedOut) {
      reservedBy = memberId;
      log('Book "$title" reserved by $memberId');
    } else {
      log('Cannot reserve "$title". It is already checked out or reserved.');
    }
  }

  @override
  void cancelReservation(String memberId) {
    if (reservedBy == memberId) {
      reservedBy = null;
      log('Reservation for "$title" cancelled by $memberId');
    }
  }
}
