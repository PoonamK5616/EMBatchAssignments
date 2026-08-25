// Helper class for required & optional named parameters

class APIConfig {
  final String endpoint;
  final int timeoutSeconds;
  final bool enableLogs;

  APIConfig({
    required this.endpoint,
    this.timeoutSeconds = 30,
    this.enableLogs = false,
  });
}


// 1. Positional, Optional Positional & Named Parameters

void sendNotification(
  String recipient, [
  String message = "Default Hello",
], {
  bool urgent = false,
  required String sender,
}) {
  print(
    'From: $sender -> '
    'To: $recipient | '
    'Msg: $message | '
    'Urgent: $urgent',
  );
}


// 2. First-Class & Anonymous Functions
// Higher-Order Function

List<int> customMap(
  List<int> list,
  int Function(int) action,
) {
  List<int> result = [];

  for (var item in list) {
    result.add(action(item));
  }

  return result;
}


// 3. Lexical Closures

Function createCounter() {
  int count = 0;

  return () {
    count++;

    return count;
  };
}


void main() {
  // APIConfig

  APIConfig config = APIConfig(
    endpoint: "https://api.example.com",
    timeoutSeconds: 60,
    enableLogs: true,
  );

  print("Endpoint: ${config.endpoint}");
  print("Timeout: ${config.timeoutSeconds}");
  print("Logs: ${config.enableLogs}");


  // 1. Combining Parameters

  sendNotification(
    "Alice",
    "Your order is ready",
    urgent: true,
    sender: "Admin",
  );

  // Optional positional parameter is omitted.
  // Default value "Default Hello" is used.

  sendNotification(
    "Bob",
    sender: "System",
  );


  // 2. Higher-Order Function

  List<int> numbers = [1, 2, 3, 4, 5];

  List<int> squares = customMap(
    numbers,
    (x) => x * x,
  );

  print("Squares: $squares");


  // 3. Closure State Isolation

  var counterA = createCounter();

  var counterB = createCounter();

  print("Counter A: ${counterA()}");

  print("Counter A: ${counterA()}");

  print("Counter B: ${counterB()}");
}