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
  sendNotification("Bob", message: "Hello there", sender: "Alice", urgent: true);

  List<int> originalList = [1, 2, 3, 4];
  List<int> mappedList = customMap(originalList, (x) => x * x);
  print('Mapped list: $mappedList');

  var counterA = createCounter();
  var counterB = createCounter();
  
  print('counterA: ${counterA()}');
  print('counterA: ${counterA()}');
  print('counterB: ${counterB()}');
}
