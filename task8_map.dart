void main() {
  Map<String, String> bookAuthors = {
    "Harry Potter": "J.K. Rowling",
    "The Alchemist": "Paulo Coelho",
    "Atomic Habits": "James Clear",
  };

  bookAuthors["The Hobbit"] = "J.R.R. Tolkien";

  print("Author: ${bookAuthors["The Hobbit"]}");

  bookAuthors.forEach((title, author) {
    print("Book: $title");
    print("Author: $author");
    print("----------------");
  });
}