void main() {
  // 1. var Keyword
  var cityName = "Tokyo";
  print('cityName: $cityName, runtimeType: ${cityName.runtimeType}');

  // 2. Object vs dynamic
  Object objVal = 42;
  dynamic dynVal = "Hello";
  dynVal = 100;

  // 3. final vs const
  final DateTime now = DateTime.now();
  const double pi = 3.14159;
  
  // 4. int & double
  int age = 25;
  double temperature = 98.6;
  print('temperature / age = ${temperature / age}');

  // 5. String & Interpolation
  String firstName = "Ada";
  String lastName = "Lovelace";
  print("User: $firstName $lastName (Length: ${(firstName + lastName).length})");

  // 6. bool
  bool isLoggedIn = false;
  isLoggedIn = !isLoggedIn;
  print('isLoggedIn: $isLoggedIn');

  // 7. Runes & UTF-32
  String emoji = '🎯';
  print('Emoji code units: ${emoji.codeUnits}');
  print('Emoji runes: ${emoji.runes.toList()}');
}