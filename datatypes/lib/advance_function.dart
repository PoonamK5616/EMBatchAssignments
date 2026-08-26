class APIConfig {
  final String endpoint;
  final int timeoutSeconds;
  final bool enableLogs;

  // 1. Constructors with mixed parameters
  APIConfig({required this.endpoint, this.timeoutSeconds = 30, this.enableLogs = false});
}

// 2. Mixed Positional and Named Parameters
void sendNotification(String recipient, {String message = "Default Hello", bool urgent = false, required String sender}) {
  print('From: $sender -> To: $recipient | Msg: $message | Urgent: $urgent');
}

// 3. Higher-Order Functions
List<int> customMap(List<int> list, int Function(int) action) {
  List<int> result = [];
  for (var item in list) result.add(action(item));
  return result;
}

// 4. Lexical Closures (State Encapsulation)
Function createCounter() {
  int count = 0;
  return () => ++count;
}

void main() {
  sendNotification("Bob", message: "Hi Bob!", urgent: true, sender: "Alice");

  List<int> squared = customMap([1, 2, 3, 4], (x) => x * x);
  print('Squared: $squared');

  Function counterA = createCounter();
  Function counterB = createCounter();

  print('counterA: ${counterA()}'); // 1
  print('counterA: ${counterA()}'); // 2
  print('counterB: ${counterB()}'); // 1
}