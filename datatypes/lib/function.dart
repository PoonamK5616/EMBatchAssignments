// 1. Parameters
void buildUser(String id, {required String username, String role = "guest"}) {
  print('ID: $id, User: $username, Role: $role');
}

// 2. Arrow Function
int square(int n) => n * n;

// 3. First-Class Functions
void executeAction(Function action) => action();

// 4. Lexical Closures
Function makeAdder(int addBy) => (int i) => i + addBy;

void main() {
  buildUser("001", username: "Alice");
  executeAction(() => print("Executing..."));
  
  Function add5 = makeAdder(5);
  print('add5(10) = ${add5(10)}');
}