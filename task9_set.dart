void main() {
  Set<String> books = {
    "Harry Potter",
    "The Alchemist",
    "Atomic Habits",
    "The Hobbit",
  };

  books.add("Clean Code");

  // Duplicate value will not be added
  books.add("Harry Potter");

  print("Unique Books:");

  for (String book in books) {
    print(book);
  }

  print("Total Books: ${books.length}");
}