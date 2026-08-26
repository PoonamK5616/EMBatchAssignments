// Helper class for required & optional named parameter rules
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

// 1. Required + Optional Positional Parameters
void sendNotification(String recipient, [String message = "Default Hello"]) {
  print('To: $recipient | Msg: $message');
}

// Named Parameters
void sendNotificationWithOptions(
  String recipient, {
  bool urgent = false,
  required String sender,
}) {
  print('From: $sender -> To: $recipient | Urgent: $urgent');
}

// 2. First-Class & Anonymous Functions
List<int> customMap(List<int> list, int Function(int) action) {
  List<int> result = [];

  for (var item in list) {
    result.add(action(item));
  }

  return result;
}

// 3. Lexical Closures
int Function() createCounter() {
  int count = 0;

  return () {
    count++;
    return count;
  };
}

void main() {
  // Required + optional positional
  sendNotification('Alex', 'Hello');

  // Named parameters
  sendNotificationWithOptions('Alex', urgent: true, sender: 'Admin');

  List<int> numbers = [1, 2, 3, 4, 5];

  List<int> squares = customMap(numbers, (x) => x * x);

  print(squares);

  var counterA = createCounter();
  var counterB = createCounter();

  print(counterA());
  print(counterA());
  print(counterB());
}
