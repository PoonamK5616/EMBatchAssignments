// 1. Positional, Optional, Named, & Default Parameters
void buildUser(String id, {required String username, String role = "guest"}) {
  print('ID: $id, User: $username, Role: $role');
}

// 2. Arrow Function (=>)
int square(int n) => n * n;

// 3. First-Class Functions & Anonymous Functions
void executeAction(Function action) {
  action();
}

// 4. Lexical Closures
Function makeAdder(int addBy) {
  return (int i) => i + addBy;
}

void main() {
  buildUser('101', username: 'Alex');

  print(square(5));

  executeAction(() => print("Executing..."));

  var add5 = makeAdder(5);

  print(add5(10));
}
