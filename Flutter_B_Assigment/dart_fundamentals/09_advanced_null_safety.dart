class DatabaseManager {
  late final String connectionString = _initConnection();

  String _initConnection() {
    print('Connecting to Database...');
    return "postgres://localhost:5432/db";
  }
}

Never failWithUnreachable(String reason) {
  throw ArgumentError("Fatal Application Error: $reason");
}

void processInput(Object? input) {
  if (input == null) {
    failWithUnreachable("Input cannot be null");
  }

  print('Input type promoted length: ${input.toString().length}');
}

class Cache {
  String? _cachedData;

  Cache([this._cachedData]);

  void validateCache() {
    final localData = _cachedData;
    if (localData != null) {
      print('Cache data length: ${localData.length}');
    } else {
      print('Cache is empty');
    }
  }
}

class UserProfile {
  late String username;
}

Map<String, List<int>?>? getData(bool hasData) {
  if (!hasData) return null;
  return {
    'scores': [90, 85, 95],
  };
}

void main() {
  DatabaseManager db = DatabaseManager();
  print('Created database manager');
  print('Connection: ${db.connectionString}');

  processInput("Hello");
  try {
    processInput(null);
  } catch (e) {
    print(e);
  }

  Cache cache1 = Cache();
  Cache cache2 = Cache("SavedData");
  cache1.validateCache();
  cache2.validateCache();

  UserProfile profile = UserProfile();
  try {
    print(profile.username);
  } catch (e) {
    print(e);
  }
  profile.username = "ashutosh";
  print('Username: ${profile.username}');

  Map<String, List<int>?>? complexData = getData(false);
  int scoreCount = complexData?['scores']?.length ?? -1;
  print('Scores count: $scoreCount');

  complexData ??= getData(true);
  int updatedScoreCount = complexData?['scores']?.length ?? -1;
  print('Scores count: $updatedScoreCount');

  Map<String, String?> settings = {'theme': 'dark'};
  String activeTheme = settings['theme']!;
  print('Theme: ${activeTheme.toUpperCase()}');
}
