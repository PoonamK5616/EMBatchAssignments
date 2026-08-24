void main() {
  // 1. var Keyword
  var cityName = "Tokyo";

  print(cityName);
  print(cityName.runtimeType);

  // 2. Object vs dynamic
  Object objVal = 42;

  // Object is type-safe, so Dart does not allow
  // calling methods that are not known to exist on Object.
  // objVal.toUpperCase(); // ❌ Compile-time error

  dynamic dynVal = "Hello";

  dynVal = 100;

  // This compiles because dynVal is dynamic,
  // but causes a runtime error because 100 is an int
  // and int does not have toUpperCase().
  // print(dynVal.toUpperCase()); // ❌ Runtime error

  print(objVal);
  print(dynVal);

  // 3. final vs const
  final DateTime currentTime = DateTime.now();

  const double pi = 3.14159;

  print(currentTime);
  print(pi);

  // final accepts DateTime.now() because the value is decided
  // when the program runs.
  // const does not accept DateTime.now() because const values
  // must be known at compile time.

  // 4. int & double
  int age = 25;
  double temperature = 98.6;

  print(age / temperature);

  // 5. String & Interpolation
  String firstName = "Ada";
  String lastName = "Lovelace";

  String user = "User: $firstName $lastName (Length: 12)";

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