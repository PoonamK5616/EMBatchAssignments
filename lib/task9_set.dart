// ignore_for_file: avoid_print

class Book {
  String title;
  String author;
  String genre;

  Book(this.title, this.author, this.genre);
}

void task9() {
  Set<String> bookGenres = {"Fantasy", "Novel", "Mystery", "Sci-Fi"};

  print("Initial Genres Set: $bookGenres");

  // Attempting to add duplicate genre
  bookGenres.add("Fantasy");
  print("After adding duplicate 'Fantasy': $bookGenres");

  // Adding new unique genre
  bookGenres.add("Biography");
  print("After adding 'Biography': $bookGenres");

  print("=======================");

  Set<String> newArrivalGenres = {"Sci-Fi", "Thriller", "Horror"};
  Set<String> combinedGenres = bookGenres.union(newArrivalGenres);
  print("Combined Genres (Union): $combinedGenres");
}

void main() {
  task9();
}
