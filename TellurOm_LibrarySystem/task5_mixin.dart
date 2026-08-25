mixin Loggable {
  void log(String message) {
    print('[LOG ${DateTime.now()}]: $message');
  }
}
