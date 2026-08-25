class LibraryItem {
  String id;
  String title;
  int year;

  LibraryItem(this.id, this.title, this.year);

  void displayInfo() {
    print('Title: $title, Year: $year (ID: $id)');
  }
}
