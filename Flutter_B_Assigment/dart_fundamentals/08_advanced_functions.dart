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

void sendNotification(
  String recipient, {
  String message = "Default Hello",
  bool urgent = false,
  required String sender,
}) {
  print('From: $sender -> To: $recipient | Msg: $message | Urgent: $urgent');
}

List<int> customMap(List<int> list, int Function(int) action) {
  List<int> result = [];
  for (var item in list) {
    result.add(action(item));
  }
  return result;
}

Function createCounter() {
  int count = 0;
  return () {
    count++;
    return count;
  };
}

void main() {
  var config = APIConfig(endpoint: "https://api.example.com");
  print('Config: ${config.endpoint}, ${config.timeoutSeconds}s');

  sendNotification(
    "Alice",
    sender: "Bob",
    message: "Hey, are you free?",
    urgent: true,
  );

  List<int> numbers = [1, 2, 3, 4, 5];
  List<int> squared = customMap(numbers, (x) => x * x);
  print('Squared: $squared');

  var counterA = createCounter();
  var counterB = createCounter();

  print('Counter A: ${counterA()}');
  print('Counter A: ${counterA()}');
  print('Counter B: ${counterB()}');
}
