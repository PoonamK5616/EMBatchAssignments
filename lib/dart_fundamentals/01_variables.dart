void main() {
  // 1. var Keyword
  // TODO: Declare a variable named 'cityName' using 'var' and assign "Tokyo".
  // Print its value and its runtimeType.
  var cityName = "Tokyo";
  print('cityName: $cityName, type: ${cityName.runtimeType}');

  // 2. Object vs dynamic
  // TODO: Create an 'Object' variable named 'objVal' = 42. Try calling a non-existent method to see compile-time error.
  Object objVal = 42;
  // objVal.nonExistentMethod(); // Compile-time error: The method 'nonExistentMethod' isn't defined for the class 'Object'.
  print('objVal: $objVal (type: ${objVal.runtimeType})');

  // TODO: Create a 'dynamic' variable named 'dynVal' = "Hello". Reassign dynamic to 100, then call .toUpperCase() to observe runtime error.
  dynamic dynVal = "Hello";
  dynVal = 100;
  try {
    dynVal.toUpperCase();
  } catch (e) {
    print('Caught runtime error calling .toUpperCase() on dynamic int: $e');
  }

  // 3. final vs const
  // TODO: Declare a 'final' DateTime variable set to DateTime.now().
  final DateTime now = DateTime.now();

  // TODO: Declare a 'const' double variable set to 3.14159.
  const double pi = 3.14159;

  // Explain in a comment why final accepts DateTime.now() while const does not.
  // Explanation: 'final' variables are initialized at runtime, so runtime functions like DateTime.now() are permitted.
  // 'const' variables are compile-time constants; their values must be explicitly known at compile time.
  print('final DateTime: $now');
  print('const pi: $pi');

  // 4. int & double
  // TODO: Declare an int 'age' = 25 and double 'temperature' = 98.6. Perform division and print.
  int age = 25;
  double temperature = 98.6;
  double divisionResult = temperature / age;
  print('temperature / age = $divisionResult');

  // 5. String & Interpolation
  // TODO: Create variables firstName = "Ada" and lastName = "Lovelace".
  // Interpolate them into a single String: "User: Ada Lovelace (Length: 12)".
  String firstName = "Ada";
  String lastName = "Lovelace";
  String fullName = "$firstName $lastName";
  String userString = "User: $fullName (Length: ${fullName.length})";
  print(userString);

  // 6. bool
  // TODO: Declare 'isLoggedIn' = false. Use logical NOT (!) to toggle it and print.
  bool isLoggedIn = false;
  isLoggedIn = !isLoggedIn;
  print('isLoggedIn toggled: $isLoggedIn');

  // 7. Runes & UTF-32
  // TODO: Create a String with emoji characters (e.g., '🎯'). Extract and print its code units and runes.
  String emojiString = '🎯';
  print('Emoji string: $emojiString');
  print('Code units: ${emojiString.codeUnits}');
  print('Runes (UTF-32 code points): ${emojiString.runes.toList()}');
}
