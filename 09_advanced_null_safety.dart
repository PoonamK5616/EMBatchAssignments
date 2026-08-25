// 1. Sound Null Safety & Late Initialization

class DatabaseManager {
  late final String connectionString = _initConnection();

  String _initConnection() {
    print("Connecting to Database...");

    return "postgres://localhost:5432/db";
  }
}


// 2. Never Type

Never failWithUnreachable(String reason) {
  throw ArgumentError(
    "Fatal Application Error: $reason",
  );
}


// 3. Type Promotion & Fail-Fast Guards

void processInput(Object? input) {
  if (input == null) {
    failWithUnreachable(
      "Input cannot be null",
    );
  }

  print(
    "Input type promoted length: "
    "${input.toString().length}",
  );
}


// Cache class

class Cache {
  String? _cachedData;

  void validateCache() {
    // Copy the nullable field into a local variable.

    final localData = _cachedData;

    if (localData != null) {
      print(
        "Cache data length: ${localData.length}",
      );
    }
  }
}


void main() {
  // 1. Database Manager

  DatabaseManager database = DatabaseManager();

  print(database.connectionString);


  // 2. Late Initialization Edge Case

  late String unassignedText;

  // Uncomment this line to intentionally observe
  // LateInitializationError.
  //
  // print(unassignedText);

  unassignedText = "Initialized";

  print(unassignedText);


  // 3. Null-Aware Operators
  // (??, ??=, ?.)

  Map<String, List<int>?>? complexData;

  int scoreCount =
     // ignore: dead_code
     complexData?['scores']?.length ?? -1;

  print("Scores count: $scoreCount");


  // 4. Bang Operator (!) Safety Boundary

  String? conditionalNullable =
      "Dart 3 Sound Null Safety";

  // ignore: unnecessary_null_comparison
  if (conditionalNullable != null) {
    print(
      // ignore: unnecessary_non_null_assertion
      conditionalNullable!.toUpperCase(),
    );
  }


  // 5. Type Promotion + Never

  processInput("Hello");


  // 6. Cache

  Cache cache = Cache();

  cache.validateCache();


  // 7. Never demonstration
  //
  // Do not uncomment unless you intentionally want
  // the program to throw an exception.
  //
  // failWithUnreachable("Something went wrong");
}