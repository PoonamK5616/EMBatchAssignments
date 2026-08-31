// Task 6: Interface
abstract class Borrowable {
  void borrowItem();
  void returnItem();
}
class Novel implements Borrowable {
  String title;
  bool isAvailable = true;
  Novel(this.title);
  @override
  void borrowItem() {
    isAvailable = false;
    print('$title is now borrowed.');
  }
  @override
  void returnItem() {
    isAvailable = true;
    print('$title is returned.');
  }
}
void main() {
  print('=== Task 6: Interface ===');
  Novel novel = Novel('The Alchemist');
  novel.borrowItem();
  novel.returnItem();
}
