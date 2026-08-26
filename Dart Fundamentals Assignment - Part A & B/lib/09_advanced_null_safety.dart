// 1. Sound Null Safety & Late Initialization Lifecycle
class DatabaseManager {
  late final String connectionString = _initConnection();

  String _initConnection() {
    print('Connecting to Database...');
    return "postgres://localhost:5432/db";
  }
}

// 2. The Never Type for Exhaustive Error Handling
Never failWithUnreachable(String reason) {
  throw ArgumentError("Fatal Application Error: $reason");
}

// Helper function testing type promotion limits
void processInput(Object? input) {
  // 3. Type Promotion & Fail-Fast Guards using Never
  if (input == null) {
    failWithUnreachable("Input cannot be null");
  }

  print('Input type promoted length: ${input.toString().length}');
}

class Cache {
  String? _cachedData;

  void validateCache() {
    final localData = _cachedData;

    if (localData != null) {
      print('Cache data length: ${localData.length}');
    }
  }
}

void main() {
  // 4. Late Initialization Edge Case
  late String unassignedText;

  // Printing before assigning would cause LateInitializationError.
  // print(unassignedText);

  unassignedText = "Initialized";

  print(unassignedText);

  // 5. Null-Aware Operators Combined
  Map<String, List<int>?>? complexData;

  int scoreCount = complexData?['scores']?.length ?? -1;

  print('Scores count: $scoreCount');

  // 6. Bang Operator (!) Safety Boundary
  String? conditionalNullable = "Dart 3 Sound Null Safety";

  if (conditionalNullable != null) {
    print(conditionalNullable!.toUpperCase());
  }
}
