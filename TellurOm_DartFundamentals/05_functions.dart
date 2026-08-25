void buildUser(String id, {required String username, String role = "guest"}) {
  print('ID: $id, User: $username, Role: $role');
}

int square(int n) => n * n;

void executeAction(Function action) {
  action();
}

Function makeAdder(int addBy) {
  return (int i) => i + addBy;
}

void main() {
  buildUser('101', username: 'john_doe');

  executeAction(() => print("Executing..."));

  var add5 = makeAdder(5);
  print('add5(10) result: ${add5(10)}');
}
