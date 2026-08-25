void task9() {
  Set<String> library = {
    "Harry Potter",
    "The Alchemist",
    "Atomic Habits",
    "The Hobbit",
    "Clean Code",
  };

  library.add("The Kite Runner");

  library.add("Harry Potter");

  print("Books in Library:");

  for (String book in library) {
    print(book);
  }

  print("\nTotal Unique Books: ${library.length}");
}

void main() {
  task9();
}