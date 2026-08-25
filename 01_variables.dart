void main() {
  // 1. var Keyword
  var cityName = "Tokyo";

  print(cityName);
  print(cityName.runtimeType);

  // 2. Object vs dynamic
  Object objVal = 42;

  print(objVal);

  // Object is type-safe.
  // The following would give a compile-time error:
  // objVal.toUpperCase();

  dynamic dynVal = "Hello";

  dynVal = 100;

  print(dynVal);

  // dynamic allows the method call at compile time,
  // but this causes a runtime error because dynVal is now an int.
  // print(dynVal.toUpperCase());

  // 3. final vs const
  final DateTime currentTime = DateTime.now();

  const double pi = 3.14159;

  print(currentTime);
  print(pi);

  // final can use DateTime.now() because its value is decided
  // at runtime. const values must be known at compile time.

  // 4. int & double
  int age = 25;
  double temperature = 98.6;

  double division = age / temperature;

  print(division);

  // 5. String & Interpolation
  String firstName = "Ada";
  String lastName = "Lovelace";

  String user =
      "User: $firstName $lastName (Length: ${firstName.length + lastName.length})";

  print(user);

  // 6. bool
  bool isLoggedIn = false;

  isLoggedIn = !isLoggedIn;

  print(isLoggedIn);

  // 7. Runes & UTF-32
  String emoji = "🎯";

  print(emoji.codeUnits);
  print(emoji.runes);
}