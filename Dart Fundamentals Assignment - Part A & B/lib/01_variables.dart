void main() {
  // 1. var Keyword
  var cityName = "Tokyo";
  print(cityName);
  print(cityName.runtimeType);

  // 2. Object vs dynamic
  Object objVal = 42;
  print(objVal);

  // objVal.nonExistentMethod();
  // This would give a compile-time error.

  dynamic dynVal = "Hello";
  print(dynVal);

  dynVal = 100;
  print(dynVal);

  // dynVal.toUpperCase();
  // This would cause a runtime error because dynVal is now an int.

  // 3. final vs const
  final DateTime currentTime = DateTime.now();
  const double piValue = 3.14159;

  print(currentTime);
  print(piValue);

  // final accepts DateTime.now() because its value is assigned at runtime.
  // const must have a value known at compile time.

  // 4. int & double
  int age = 25;
  double temperature = 98.6;

  print(age / temperature);

  // 5. String & Interpolation
  String firstName = "Ada";
  String lastName = "Lovelace";

  print(
    "User: $firstName $lastName "
    "(Length: ${firstName.length + lastName.length + 1})",
  );

  // 6. bool
  bool isLoggedIn = false;

  isLoggedIn = !isLoggedIn;

  print(isLoggedIn);

  // 7. Runes & UTF-32
  String text = 'Hello 🎯';

  print(text.codeUnits);
  print(text.runes);
}
