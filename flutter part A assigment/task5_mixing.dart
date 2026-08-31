// Task 5: Mixins
mixin LogInfo {
  void printLog(String message) {
    print('[LOG]: $message');
  }
}
class Book with LogInfo {
  String title;
  Book(this.title);
  void saveBook() {
    printLog('Book "$title" is saved to library.');
  }
}
void main() {
  print('=== Task 5: Mixin ===');
  Book book = Book('Dart for Beginners');
  book.saveBook();
}
