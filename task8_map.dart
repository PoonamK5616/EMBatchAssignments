void task8() {
  Map<String, String> library = {
    "Harry Potter": "J.K. Rowling",
    "The Alchemist": "Paulo Coelho",
    "Atomic Habits": "James Clear",
    "The Hobbit": "J.R.R. Tolkien",
  };

  library["Clean Code"] = "Robert C. Martin";

  print("Author of The Hobbit: ${library["The Hobbit"]}");

  print("\nLibrary Books:");

  library.forEach((title, author) {
    print("Book: $title");
    print("Author: $author");
    print("-------------------");
  });
}

void main() {
  task8();
}