// ignore_for_file: avoid_print, file_names

// Helper class for required & optional named parameter rules
class APIConfig {
  final String endpoint;
  final int timeoutSeconds;
  final bool enableLogs;

  // TODO: Implement constructor using:
  // - 'required' modifier for 'endpoint'
  // - Named optional default value for 'timeoutSeconds' (default: 30)
  // - Named optional default value for 'enableLogs' (default: false)
  APIConfig({
    required this.endpoint,
    this.timeoutSeconds = 30,
    this.enableLogs = false,
  });
}

// 1. Combining Positional and Named Parameters
// TODO: Create a function 'sendNotification' that takes:
// - Positional required String: recipient
// - Named parameters: {String message = "Default Hello", bool urgent = false, required String sender}
void sendNotification(
  String recipient, {
  String message = "Default Hello",
  bool urgent = false,
  required String sender,
}) {
  print('From: $sender -> To: $recipient | Msg: $message | Urgent: $urgent');
}

// 2. First-Class & Anonymous Functions (Higher-Order Functions)
// TODO: Write a function 'customMap' that takes a List<int> and a Function(int) parameter.
// Return a new list where each element is transformed by the passed closure.
List<int> customMap(List<int> list, int Function(int) action) {
  List<int> result = [];
  for (var item in list) {
    result.add(action(item));
  }
  return result;
}

// 3. Lexical Closures (State Encapsulation)
Function createCounter() {
  int count = 0; // Lexically captured variable
  return () {
    count++;
    return count;
  };
}

void main() {
  // TODO: Call sendNotification using mix of positional and named parameters.
  sendNotification(
    "Alice",
    message: "Hello World",
    sender: "Bob",
    urgent: true,
  );
  sendNotification("Charlie", sender: "Admin");

  // TODO: Call customMap using an inline arrow function anonymous closure: (x) => x * x.
  List<int> numbers = [1, 2, 3, 4, 5];
  List<int> squared = customMap(numbers, (x) => x * x);
  print('Original numbers: $numbers');
  print('Squared numbers: $squared');

  // TODO: Instantiate two separate counters: 'counterA' and 'counterB'.
  // Call counterA twice and counterB once. Print results to prove state isolation between instances.
  var counterA = createCounter();
  var counterB = createCounter();

  print('Counter A (1st call): ${counterA()}');
  print('Counter A (2nd call): ${counterA()}');
  print('Counter B (1st call): ${counterB()}');

  var config = APIConfig(endpoint: "https://api.example.com");
  print(
    'API Config -> Endpoint: ${config.endpoint}, Timeout: ${config.timeoutSeconds}s, Logs: ${config.enableLogs}',
  );
}
