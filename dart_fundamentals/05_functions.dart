// 1. Positional, Optional, Named, & Default Parameters
// TODO: Create function 'buildUser' with:
// - Positional parameter: String id
// - Named parameter with 'required': String username
// - Optional named parameter with default value: String role = "guest"
void buildUser(String id, {required String username, String role = "guest"}) {
  print('ID: $id, User: $username, Role: $role');
}

// 2. Arrow Function (=>)
// TODO: Define arrow function 'square(int n)' returning n * n.
int square(int n) => n * n;

// 3. First-Class Functions & Anonymous Functions
void executeAction(Function action) {
  action();
}

// 4. Lexical Closures
Function makeAdder(int addBy) {
  return (int i) => i + addBy; // Retains access to addBy
}

void main() {
  // TODO: Call buildUser with required parameters.
  print('--- buildUser Calls ---');
  buildUser("U101", username: "ada_lovelace");
  buildUser("U102", username: "alan_turing", role: "admin");

  print('--- Arrow Function ---');
  print('square(5): ${square(5)}');

  // TODO: Pass an anonymous function () => print("Executing...") into executeAction().
  print('--- First-Class / Anonymous Functions ---');
  executeAction(() => print("Executing... anonymous function executed via executeAction!"));

  // TODO: Create an 'add5' closure using makeAdder(5) and evaluate add5(10).
  print('--- Lexical Closures ---');
  var add5 = makeAdder(5);
  int closureResult = add5(10);
  print('add5(10) evaluation: $closureResult');
}
