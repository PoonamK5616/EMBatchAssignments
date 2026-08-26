class DatabaseManager {
  // 1. Sound Null Safety & Late Initialization Lifecycle
  late final String connectionString = _initConnection();
  String _initConnection() => "postgres://localhost:5432/db";
}

// 2. The Never Type
Never failWithUnreachable(String reason) => throw ArgumentError("Fatal Error: $reason");

void processInput(Object? input) {
  // 3. Type Promotion & Fail-Fast Guards
  if (input == null) failWithUnreachable("Input cannot be null");
  print('Input type promoted length: ${input.toString().length}');
}

class Cache {
  String? _cachedData;

  void validateCache() {
    // 4. Fix field promotion limitation
    final localData = _cachedData;
    if (localData != null) print('Cache data length: ${localData.length}');
  }
}

void main() {
  // 5. Late Initialization Edge Case
  late String unassignedText;
  unassignedText = "Initialized";
  print(unassignedText);

  // 6. Null-Aware Operators Combined
  Map<String, List<int>?>? complexData;
  int scoreCount = complexData?['scores']?.length ?? -1;
  print('Scores count: $scoreCount');

  // 7. Bang Operator
  String? conditionalNullable = "Dart 3 Sound Null Safety";
  if (conditionalNullable != null) print(conditionalNullable!.toUpperCase());
}