void main() {
  var cityName = "Tokyo";
  print('City: $cityName, Type: ${cityName.runtimeType}');

  Object objVal = 42;

  dynamic dynVal = "Hello";
  dynVal = 100;

  final DateTime now = DateTime.now();
  
  const double pi = 3.14159;

  int age = 25;
  double temperature = 98.6;
  print('Temperature divided by age: ${temperature / age}');

  String firstName = "Ada";
  String lastName = "Lovelace";
  String interpolated = "User: $firstName $lastName (Length: ${firstName.length + lastName.length})";
  print(interpolated);

  bool isLoggedIn = false;
  isLoggedIn = !isLoggedIn;
  print('isLoggedIn: $isLoggedIn');

  String emoji = '🎯';
  print('Emoji code units: ${emoji.codeUnits}');
  print('Emoji runes: ${emoji.runes.toList()}');
}
