// ignore_for_file: avoid_print

class Book {
  String title;
  String author;
  String genre;
  double price;

  Book(this.title, this.author, this.genre, this.price);

  void displayBook() {
    print("Title : $title");
    print("Author : $author");
    print("Genre : $genre");
    print("Price : \$$price");
  }
}

mixin Discountable {
  double discount = 0.0;

  void applyDiscount(double percentage) {
    discount = percentage;
    print("Discount of $percentage% applied!");
  }

  double calculateDiscountedPrice(double originalPrice) {
    return originalPrice * (1 - discount / 100);
  }
}

mixin Rating {
  double rating = 0.0;

  void setRating(double r) {
    rating = r;
    print("Rating set to: $rating / 5.0");
  }
}

class StoreBook extends Book with Discountable, Rating {
  StoreBook(super.title, super.author, super.genre, super.price);

  void displayStoreBook() {
    displayBook();
    setRating(4.8);
    applyDiscount(15);
    print(
      "Final Price : \$${calculateDiscountedPrice(price).toStringAsFixed(2)}",
    );
  }
}

void task5() {
  StoreBook book = StoreBook(
    "Harry Potter and the Chamber of Secrets",
    "J.K. Rowling",
    "Fantasy",
    20.0,
  );

  book.displayStoreBook();
}

void main() {
  task5();
}
