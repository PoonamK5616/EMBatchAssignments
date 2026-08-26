// ignore_for_file: avoid_print, file_names, prefer_final_fields

// 1. Sound Null Safety & Late Initialization Lifecycle
class DatabaseManager {
  // 'late' variable initialization deferred until first read
  late final String connectionString = _initConnection();

  String _initConnection() {
    print('Connecting to Database...');
    return "postgres://localhost:5432/db";
  }
}

class LateFieldContainer {
  late String unassignedText;
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

  // Type Promotion in effect: 'input' is automatically promoted from Object? to Object (non-nullable)
  print('Input type promoted length: ${input.toString().length}');
}

class Cache {
  String? _cachedData = "Cached Content"; // Private field

  void validateCache() {
    // Note: Private fields CANNOT be type-promoted automatically because
    // Dart cannot guarantee another method won't mutate the field mid-execution.

    // TODO: Fix field promotion limitation by copying to a local variable:
    final localData = _cachedData;
    if (localData != null) {
      // localData is safely promoted to String here
      print('Cache data length: ${localData.length}');
    }
  }
}

void demonstrateBangOperator(String? conditionalNullable) {
  // TODO: Demonstrate safe bang operator usage after confirming non-null status.
  if (conditionalNullable != null) {
    // ignore: unnecessary_non_null_assertion
    print(conditionalNullable!.toUpperCase());
  }
}

Map<String, List<int>?>? getComplexData() => {
  'scores': [85, 90, 95],
};

void main() {
  // 4. Late Initialization Edge Case
  var lateContainer = LateFieldContainer();
  // TODO: Try printing 'unassignedText' without assigning it first. Observe LateInitializationError in terminal.
  // Then assign unassignedText = "Initialized" and print.
  try {
    print(lateContainer.unassignedText);
  } catch (e) {
    print('Caught LateInitializationError: $e');
  }
  lateContainer.unassignedText = "Initialized";
  print('Assigned unassignedText: ${lateContainer.unassignedText}');

  // DatabaseManager late final demonstration
  var db = DatabaseManager();
  print('DatabaseManager instantiated without reading connectionString.');
  print('Reading connectionString: ${db.connectionString}');

  // 5. Null-Aware Operators Combined (??, ??=, ?.)
  Map<String, List<int>?>? complexData = getComplexData();

  // TODO: Retrieve the length of the list under key "scores" safely.
  // Use null-aware access (?.) and if-null operator (??) to return -1 if any level is null:
  int scoreCount = complexData?['scores']?.length ?? -1;
  print('Scores count: $scoreCount');

  // 6. Bang Operator (!) Safety Boundary
  demonstrateBangOperator("Dart 3 Sound Null Safety");

  // Demonstrate Cache field promotion workaround
  Cache().validateCache();

  // Demonstrate Never type promotion guard
  processInput("Valid String Input");
  Object? nullInput;
  try {
    processInput(nullInput);
  } catch (e) {
    print('Caught Never Guard Error: $e');
  }
}
